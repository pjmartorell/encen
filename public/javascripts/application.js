// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
  $("#menu" ).accordion({
    autoHeight: false,
    navigation: true
  })

  $("a").click(function() {
    window.location = $(this).attr("href")
  })
   
});



// SCRROLL
function filterPath(string) {
return string
  .replace(/^\//,'')
  .replace(/(index|default).[a-zA-Z]{3,4}$/,'')
  .replace(/\/$/,'');
}
var locationPath = filterPath(location.pathname);
var scrollElem = scrollableElement('html', 'body');

$('a[href*=#]').each(function() {
  var thisPath = filterPath(this.pathname) || locationPath;
  if (  locationPath == thisPath
  && (location.hostname == this.hostname || !this.hostname)
  && this.hash.replace(/#/,'') ) {
    var $target = $(this.hash), target = this.hash;
    if (target) {
      var targetOffset = $target.offset().top;
      $(this).click(function(event) {
        event.preventDefault();
        $(scrollElem).animate({scrollTop: targetOffset}, 1800, function() {
          location.hash = target;
        });
      });
    }
  }
});

// use the first element that is "scrollable"
function scrollableElement(els) {
  for (var i = 0, argLength = arguments.length; i <argLength; i++) {
    var el = arguments[i],
        $scrollElement = $(el);
    if ($scrollElement.scrollTop()> 0) {
      return el;
    } else {
      $scrollElement.scrollTop(1);
      var isScrollable = $scrollElement.scrollTop()> 0;
      $scrollElement.scrollTop(0);
      if (isScrollable) {
        return el;
      }
    }
  }
  return [];
}

function initializeMaps() {
	var point = new google.maps.LatLng(41.392619,2.177183);
  var mapOptions = {
		center: point,
    zoom: 14,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    streetViewControl: false,
	  navigationControl: true,
	  mapTypeControl: false,
	  scaleControl: false
  };

  var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
	var infowindow = new google.maps.InfoWindow({
	    content: "<div id='infowindow'><h3>Estanterías Horta</h3><p style='color:black'>C/ Horta, 73 <br />08032 Barcelona</p></div>"
	});

	var marker = new google.maps.Marker({
	    position: point,
	    map: map,
	    title:"Estanterías Metálicas Horta"
	});

  infowindow.open(map,marker);
}