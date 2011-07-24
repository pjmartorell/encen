/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function(config){
  config.toolbar_Custom =
    [
      ['Bold','Italic','Underline','Strike'],
      ['Styles','Format','Font','FontSize'],
      ['TextColor','BGColor'],
      '/',
      ['Cut','Copy','Paste','PasteText','PasteFromWord'],
      ['Undo','Redo'],
      ['NumberedList','BulletedList'],
      ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
      ['BidiLtr', 'BidiRtl' ],
      ['Link','Unlink'],
      ['Image','Table','HorizontalRule'],
      ['Print','About']
    ];
  config.toolbar = "Custom";
  config.width = "650px";
  config.height = "250px";
	config.resize_enabled = false;
	// Load the Catalan interface.
	config.language = 'ca';
};
