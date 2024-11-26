// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "trix"

import "@rails/actiontext"
import { Application } from "@hotwired/stimulus"
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

import Tagify from "@yaireo/tagify"

var input = document.getElementById("tags-input");
// tagifyの設定
  var tagify = new Tagify(input, {whitelist:[],
    dropdown:{
      enabled: 0,
      closeOnSelect: false,
    },
  })
