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

import { library, dom } from '@fortawesome/fontawesome-svg-core'
import { fas } from '@fortawesome/free-solid-svg-icons'
library.add(fas)
dom.watch()

import SimplePicker from 'simplepicker'
window.SimplePicker = SimplePicker

import moment from 'moment'
window.moment = moment

//import TheDatepicker from 'thedatepicker/dist/the-datepicker'
//window.TheDatepicker = TheDatepicker;

//ActiveStorageDragAndDrop.processUploadQueue("x", callback);

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
