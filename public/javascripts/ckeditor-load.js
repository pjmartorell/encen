$(document).ready(function() {
  // Activate every ckeditor
  $("textarea.editor").ckeditor();

  // When attempting to submit update the text areas
  // NOTE: As we are using HTML5's "require" (which shows, on error, a text next to the input to validate),
  // and having into account that CKEditor hides the textareas, if a CKEditor is void and required the
  // form won't be posted but no text error will be shown
  $('input[class=button]').bind('click', function(){
    for (instance in CKEDITOR.instances){
      CKEDITOR.instances[instance].updateElement();
    }
  });
});
