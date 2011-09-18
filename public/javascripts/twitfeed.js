$(document).ready(function() {
  feed = "http://twitter.com/statuses/user_timeline/josep_romeu.rss";
	var options = {
			numResults : 3,
			displayTime : 4000,
	    horizontal : false,
	    title : "Tweets recents"
	  };
	new GFdynamicFeedControl(feed, 'twitter-feed', options);
});

/* 
function twitterCallback2(twitters) {
  var statusHTML = [];
  for (var i=0; i<twitters.length; i++){
    var username = twitters[i].user.screen_name;
    var status_title = twitters[i].text.replace(/((https?|s?ftp|ssh)\:\/\/[^"\s\<\>]*[^.,;'">\:\s\<\>\)\]\!])/g, function(url) {
      return '<a href="'+url+'">'+url+'</a>';
    });
		var status = status_title.replace(/\B@([_a-z0-9]+)/ig, function(reply) {
      return  reply.charAt(0)+'<a href="http://twitter.com/'+reply.substring(1)+'" target="_blank">'+reply.substring(1)+'</a>';
    });
    statusHTML.push('<li><span class="twitle"><a href="http://twitter.com/'+username+'/statuses/'+twitters[i].id_str+'" target="_blank">'+status_title+'</a></span><span style="font-size:90%">'+relative_time(twitters[i].created_at)+'</span><span>'+status+'</span></li>');
  }
  document.getElementById('twitter_update_list').innerHTML = statusHTML.join('');
}

function relative_time(time_value) {
  var values = time_value.split(" ");
  time_value = values[1] + " " + values[2] + ", " + values[5] + " " + values[3];
  var parsed_date = Date.parse(time_value);
  var relative_to = (arguments.length > 1) ? arguments[1] : new Date();
  var delta = parseInt((relative_to.getTime() - parsed_date) / 1000);
  delta = delta + (relative_to.getTimezoneOffset() * 60);

  if (delta < 60) {
    return "fa menys d'un minut";
  } else if(delta < 120) {
    return 'fa un minut';
  } else if(delta < (60*60)) {
    return 'fa ' + (parseInt(delta / 60)).toString() + ' minutes';
  } else if(delta < (120*60)) {
    return 'fa una hora';
  } else if(delta < (24*60*60)) {
    return 'fa ' + (parseInt(delta / 3600)).toString() + ' hores';
  } else if(delta < (48*60*60)) {
    return 'fa 1 dia';
  } else {
    return 'fa ' + (parseInt(delta / 86400)).toString() + ' dies';
  }
}*/