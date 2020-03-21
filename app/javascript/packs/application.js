// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("jquery-ui")

import "bootstrap"

import ActiveStorageDragAndDrop from 'active_storage_drag_and_drop'
import processUploadQueue from 'active_storage_drag_and_drop'

ActiveStorageDragAndDrop.start()

window.jQuery = $;
window.$ = $;
window.asdd = ActiveStorageDragAndDrop;
var callback = function(error) {
  if (error) {
    // …handle error…
  } else {
    // …do your stuff
  }
}

//ActiveStorageDragAndDrop.processUploadQueue("x", callback);

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
