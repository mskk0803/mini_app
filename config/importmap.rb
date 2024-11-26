# Pin npm packages by running ./bin/importmap

pin "application"
pin "@rails/actioncable", to: "actioncable.esm.js"
pin "@rails/activestorage", to: "activestorage.esm.js"
pin "@rails/actiontext", to: "actiontext.esm.js"
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"
pin "stimulus-autocomplete" # @3.1.0
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2

# javascript反映
pin_all_from "app/javascript/controllers", under: "controllers"
# pin "tags_controller"

# tagifyの反映
pin "@yaireo/tagify", to: "@yaireo--tagify.js" # @4.32.0
