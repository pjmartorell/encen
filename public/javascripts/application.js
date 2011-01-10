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

