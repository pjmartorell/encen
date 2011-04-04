// Edited code from http://jsbin.com/egefi/edit
function insertAtCaret(body, img) {
    var editor = $('textarea.editor').ckeditorGet();
    editor.insertHtml(img);
}

function initImageDelete(id){
  $("#destroy-"+id).click(function(){
    if(confirm("N'estas segur?")){
      $("#" +id+" > .button_to").ajaxSubmit();
    }
  });
}

function initDragAndDrop(){
  var options = {
    accept: "img.placeholder",
    drop: function(ev, ui) {
      var thumbnail_path = ui.draggable.eq(0).attr("src");
      var original_path = thumbnail_path.replace("thumb_","");
      var img = "<img src=\""+original_path+"\">";
      var ckeditor_body = $("iframe").contents().find("body");
      insertAtCaret(ckeditor_body, img);
    }
  };

  $("img.placeholder").draggable({
    iframeFix: true,
    helper:'clone',
    appendTo: 'body',
    start: function(event, ui) {
      var iframe = $("iframe");
      var body = $("iframe").contents().find("body");
      $("div#pseudodroppable").css({
        position:"absolute",
        top:iframe.position().top,
        left:iframe.position().left,
        width:iframe.width(),
        height:iframe.height()
      }).droppable(options).show();
    },
    stop: function(event, ui) {
      $("div#pseudodroppable").droppable('destroy').hide();
    }
  });
}

$(document).ready(function() {
  initDragAndDrop();
});
