/*
 * Facebox (for jQuery)
 * version: 1.2 (05/05/2008)
 * @requires jQuery v1.2 or later
 *
 * Examples at http://famspam.com/facebox/
 *
 * Licensed under the MIT:
 *   http://www.opensource.org/licenses/mit-license.php
 *
 * Copyright 2007, 2008 Chris Wanstrath [ chris@ozmm.org ]
 *
 * Usage:
 *  
 *  jQuery(document).ready(function() {
 *    jQuery('a[rel*=facebox]').facebox() 
 *  })
 *
 *  <a href="#terms" rel="facebox">Terms</a>
 *    Loads the #terms div in the box
 *
 *  <a href="terms.html" rel="facebox">Terms</a>
 *    Loads the terms.html page in the box
 *
 *  <a href="terms.png" rel="facebox">Terms</a>
 *    Loads the terms.png image in the box
 *
 *
 *  You can also use it programmatically:
 * 
 *    jQuery.facebox('some html')
 *
 *  The above will open a facebox with "some html" as the content.
 *    
 *    jQuery.facebox(function($) { 
 *      $.get('blah.html', function(data) { $.facebox(data) })
 *    })
 *
 *  The above will show a loading screen before the passed function is called,
 *  allowing for a better ajaxy experience.
 *
 *  The facebox function can also display an ajax page or image:
 *  
 *    jQuery.facebox({ ajax: 'remote.html' })
 *    jQuery.facebox({ image: 'dude.jpg' })
 *
 *  Want to close the facebox?  Trigger the 'close.facebox' document event:
 *
 *    jQuery(document).trigger('close.facebox')
 *
 *  Facebox also has a bunch of other hooks:
 *
 *    loading.facebox
 *    beforeReveal.facebox
 *    reveal.facebox (aliased as 'afterReveal.facebox')
 *    init.facebox
 *
 *  Simply bind a function to any of these hooks:
 *
 *   $(document).bind('reveal.facebox', function() { ...stuff to do after the facebox and contents are revealed... })
 *
 */
(function($) {
  $.facebox = function(data, klass) {
    $.facebox.loading()

    if (data.ajax) fillFaceboxFromAjax(data.ajax)
    else if (data.image) fillFaceboxFromImage(data.image)
    else if (data.div) fillFaceboxFromHref(data.div)
    else if ($.isFunction(data)) data.call($)
    else $.facebox.reveal(data, klass)
  }

  /*
   * Public, $.facebox methods
   */

  $.extend($.facebox, {
    settings: {
      opacity      : 0,
      overlay      : true,
      loadingImage : '/images/loading.gif',
      closeImage   : '',
      imageTypes   : [ 'png', 'jpg', 'jpeg', 'gif' ],
      faceboxHtml  : '\
    <div id="facebox" style="display:none; top:0;"> \
      <div class="popup"> \
        <table> \
          <tbody> \
            <tr> \
              <td class="tl"/><td class="b"/><td class="tr"/> \
            </tr> \
            <tr> \
              <td class="b"/> \
              <td class="body"> \
                <div class="content"> \
                </div> \
              </td> \
              <td class="b"/> \
            </tr> \
            <tr> \
              <td class="bl"/><td class="b"/><td class="br"/> \
            </tr> \
          </tbody> \
        </table> \
      </div> \
    </div>'
    },

    loading: function() {
      init()
      if ($('#facebox .loading').length == 1) return true
      showOverlay()

      $('#facebox .content').empty()
      $('#facebox .body').children().hide().end().
        append('<div class="loading"><img src="'+$.facebox.settings.loadingImage+'"/></div>')

      $('#facebox').css({
        top:	getPageScroll()[1] + (getPageHeight() / 10),
        left:	385.5
      }).show()

      $(document).bind('keydown.facebox', function(e) {
        if (e.keyCode == 27) $.facebox.close()
        return true
      })
      $(document).trigger('loading.facebox')
    },

    reveal: function(data, klass) {
      $(document).trigger('beforeReveal.facebox')
      if (klass) $('#facebox .content').addClass(klass)
      $('#facebox .content').append(data)
      $('#facebox .loading').remove()
      $('#facebox .body').children().fadeIn('normal')
      $('#facebox').css('left', $(window).width() / 2 - ($('#facebox table').width() / 2))
      $(document).trigger('reveal.facebox').trigger('afterReveal.facebox')
    },

    close: function() {
      $(document).trigger('close.facebox')
      return false
    }
  })

  /*
   * Public, $.fn methods
   */

  $.fn.facebox = function(settings) {
    init(settings)

    function clickHandler() {
      $.facebox.loading(true)

      // support for rel="facebox.inline_popup" syntax, to add a class
      // also supports deprecated "facebox[.inline_popup]" syntax
      var klass = this.rel.match(/facebox\[?\.(\w+)\]?/)
      if (klass) klass = klass[1]

      fillFaceboxFromHref(this.href, klass)
      return false
    }

    return this.click(clickHandler)
  }

  /*
   * Private methods
   */

  // called one time to setup facebox on this page
  function init(settings) {
    if ($.facebox.settings.inited) return true
    else $.facebox.settings.inited = true

    $(document).trigger('init.facebox')
    makeCompatible()

    var imageTypes = $.facebox.settings.imageTypes.join('|')
    $.facebox.settings.imageTypesRegexp = new RegExp('\.' + imageTypes + '$', 'i')

    if (settings) $.extend($.facebox.settings, settings)
    $('body').append($.facebox.settings.faceboxHtml)

    var preload = [ new Image(), new Image() ]
    preload[0].src = $.facebox.settings.closeImage
    preload[1].src = $.facebox.settings.loadingImage

    $('#facebox').find('.b:first, .bl, .br, .tl, .tr').each(function() {
      preload.push(new Image())
      preload.slice(-1).src = $(this).css('background-image').replace(/url\((.+)\)/, '$1')
    })

    $('#facebox .close').click($.facebox.close)
    $('#facebox .close_image').attr('src', $.facebox.settings.closeImage)
  }
  
  // getPageScroll() by quirksmode.com
  function getPageScroll() {
    var xScroll, yScroll;
    if (self.pageYOffset) {
      yScroll = self.pageYOffset;
      xScroll = self.pageXOffset;
    } else if (document.documentElement && document.documentElement.scrollTop) {	 // Explorer 6 Strict
      yScroll = document.documentElement.scrollTop;
      xScroll = document.documentElement.scrollLeft;
    } else if (document.body) {// all other Explorers
      yScroll = document.body.scrollTop;
      xScroll = document.body.scrollLeft;	
    }
    return new Array(xScroll,yScroll) 
  }

  // Adapted from getPageSize() by quirksmode.com
  function getPageHeight() {
    var windowHeight
    if (self.innerHeight) {	// all except Explorer
      windowHeight = self.innerHeight;
    } else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode
      windowHeight = document.documentElement.clientHeight;
    } else if (document.body) { // other Explorers
      windowHeight = document.body.clientHeight;
    }	
    return windowHeight
  }

  // Backwards compatibility
  function makeCompatible() {
    var $s = $.facebox.settings

    $s.loadingImage = $s.loading_image || $s.loadingImage
    $s.closeImage = $s.close_image || $s.closeImage
    $s.imageTypes = $s.image_types || $s.imageTypes
    $s.faceboxHtml = $s.facebox_html || $s.faceboxHtml
  }

  // Figures out what you want to display and displays it
  // formats are:
  //     div: #id
  //   image: blah.extension
  //    ajax: anything else
  function fillFaceboxFromHref(href, klass) {
    // div
    if (href.match(/#/)) {
      var url    = window.location.href.split('#')[0]
      var target = href.replace(url,'')
      $.facebox.reveal($(target).clone().show(), klass)

    // image
    } else if (href.match($.facebox.settings.imageTypesRegexp)) {
      fillFaceboxFromImage(href, klass)
    // ajax
    } else {
      fillFaceboxFromAjax(href, klass)
    }
  }

  function fillFaceboxFromImage(href, klass) {
    var image = new Image()
    image.onload = function() {
      $.facebox.reveal('<div class="image"><img src="' + image.src + '" /></div>', klass)
    }
    image.src = href
  }

  function fillFaceboxFromAjax(href, klass) {
    $.get(href, function(data) { $.facebox.reveal(data, klass) })
  }

  function skipOverlay() {
    return $.facebox.settings.overlay == false || $.facebox.settings.opacity === null 
  }

  function showOverlay() {
    if (skipOverlay()) return

    if ($('facebox_overlay').length == 0) 
      $("body").append('<div id="facebox_overlay" class="facebox_hide"></div>')

    $('#facebox_overlay').hide().addClass("facebox_overlayBG")
      .css('opacity', $.facebox.settings.opacity)
      .click(function() { $(document).trigger('close.facebox') })
      .fadeIn(200)
    return false
  }

  function hideOverlay() {
    if (skipOverlay()) return

    $('#facebox_overlay').fadeOut(200, function(){
      $("#facebox_overlay").removeClass("facebox_overlayBG")
      $("#facebox_overlay").addClass("facebox_hide") 
      $("#facebox_overlay").remove()
    })
    
    return false
  }

  /*
   * Bindings
   */

  $(document).bind('close.facebox', function() {
    $(document).unbind('keydown.facebox')
    $('#facebox').fadeOut(function() {
      $('#facebox .content').removeClass().addClass('content')
      hideOverlay()
      $('#facebox .loading').remove()
    })
  })

})(jQuery);


$(document).ready(function() {
	jQuery(document).ready(function($) {
	  $('a[rel*=facebox]').facebox()
	})

	/* Growl-like messages */
	$(".flash_message").purr()
});
function initializeMaps() {  
	var point = new google.maps.LatLng(40.397386,-3.664148);
  var mapOptions = {
		center: point,
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    streetViewControl: false,
	  navigationControl: true,
	  mapTypeControl: false,
	  scaleControl: false
  };

  var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
	var infowindow = new google.maps.InfoWindow({
	    content: "<div id='infowindow'><h3><b>MTC</b> Limpiezas</h3><p style='color:black'>C/ Sierra de los Filabres 52<br />28038, Madrid</p></div>"

	});

	var marker = new google.maps.Marker({
	    position: point,
	    map: map,
	    title:"MTC Limpiezas"
	});

  infowindow.open(map,marker);
}

/**
 * jquery.purr.js
 * Copyright (c) 2008 Net Perspective (net-perspective.com)
 * Licensed under the MIT License (http://www.opensource.org/licenses/mit-license.php)
 *
 * @author R.A. Ray
 * @projectDescription	jQuery plugin for dynamically displaying unobtrusive messages in the browser. Mimics the behavior of the MacOS program "Growl."
 * @version 0.1.0
 *
 * @requires jquery.js (tested with 1.2.6)
 *
 * @param fadeInSpeed 					int - Duration of fade in animation in miliseconds
 * 													default: 500
 *	@param fadeOutSpeed  				int - Duration of fade out animationin miliseconds
 														default: 500
 *	@param removeTimer  				int - Timeout, in miliseconds, before notice is removed once it is the top non-sticky notice in the list
 														default: 4000
 *	@param isSticky 						bool - Whether the notice should fade out on its own or wait to be manually closed
 														default: false
 *	@param usingTransparentPNG 	bool - Whether or not the notice is using transparent .png images in its styling
 														default: false
 */

( function( $ ) {

	$.purr = function (notice, options)
	{
		// Convert notice to a jQuery object
		notice = $(notice);

		// Add a class to denote the notice as not sticky
		if (!options.isSticky)
		{
			notice.addClass('purr');
		};

		// Get the container element from the page
		var cont = document.getElementById( 'purr' );

		// If the container doesn't yet exist, we need to create it
		if ( !cont )
		{
			cont = '<div id="purr"></div>';
		}

		// Convert cont to a jQuery object
		cont = $( cont );

		// Add the container to the page
		$( 'body' ).append( cont );

		notify();

		function notify ()
		{
			// Set up the close button
			var close = document.createElement( 'a' );
			$( close ).attr(
				{
					className: 'close',
					href: '#close',
					innerHTML: ''
				}
			)
				.appendTo( notice )
					.click( function ()
						{
							removeNotice();

							return false;
						}
					);

			// Add the notice to the page and keep it hidden initially
			notice.appendTo( cont )
				.hide();

			if ( jQuery.browser.msie && options.usingTransparentPNG )
			{
				// IE7 and earlier can't handle the combination of opacity and transparent pngs, so if we're using transparent pngs in our
				// notice style, we'll just skip the fading in.
				notice.show();
			}
			else
			{
				//Fade in the notice we just added
				notice.fadeIn( options.fadeInSpeed );
			}

			// Set up the removal interval for the added notice if that notice is not a sticky
			if ( !options.isSticky )
			{
				var topSpotInt = setInterval( function ()
				{
					// Check to see if our notice is the first non-sticky notice in the list
					if ( notice.prevAll( '.purr' ).length == 0 )
					{
						// Stop checking once the condition is met
						clearInterval( topSpotInt );

						// Call the close action after the timeout set in options
						setTimeout( function ()
							{
								removeNotice();
							}, options.removeTimer
						);
					}
				}, 200 );
			}
		}

		function removeNotice ()
		{
			// IE7 and earlier can't handle the combination of opacity and transparent pngs, so if we're using transparent pngs in our
			// notice style, we'll just skip the fading out.
			if ( jQuery.browser.msie && options.usingTransparentPNG )
			{
				notice.css( { opacity: 0	} )
					.animate(
						{
							height: '0px'
						},
						{
							duration: options.fadeOutSpeed,
							complete:  function ()
								{
									notice.remove();
								}
							}
					);
			}
			else
			{
				// Fade the object out before reducing its height to produce the sliding effect
				notice.animate(
					{
						opacity: '0'
					},
					{
						duration: options.fadeOutSpeed,
						complete: function ()
							{
								notice.animate(
									{
										height: '0px'
									},
									{
										duration: options.fadeOutSpeed,
										complete: function ()
											{
												notice.remove();
											}
									}
								);
							}
					}
				);
			}
		};
	};

	$.fn.purr = function ( options )
	{
		options = options || {};
		options.fadeInSpeed = options.fadeInSpeed || 500;
		options.fadeOutSpeed = options.fadeOutSpeed || 500;
		options.removeTimer = options.removeTimer || 4000;
		options.isSticky = options.isSticky || false;
		options.usingTransparentPNG = options.usingTransparentPNG || false;

		this.each( function()
			{
				new $.purr( this, options );
			}
		);

		return this;
	};
})( jQuery );

