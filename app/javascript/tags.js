import { Controller } from "@hotwired/stimulus"
import Tagify from '@yaireo/tagify'
 

// Connects to data-controller="tag"
export default class extends Controller {
    connect() {
      var input = document.getElementById("tags-input");
    // tagifyの設定
      var tagify = new Tagify(input, {whitelist:[],
        dropdown:{
          enabled: 0,
          closeOnSelect: false,
        },
      }),
      controller; // for aborting the call
  
    // 入力で検索結果を取得する
      tagify.on('input', onInput)
      function onInput( e ){
      var value = e.detail.value
      tagify.whitelist = null // whitelistをリセットする
  
      controller && controller.abort()
      controller = new AbortController()
  
      fetch(`/tags/search?query=${value}`, {signal:controller.signal})
        .then(RES => RES.json())
        .then(function(newWhitelist){
          tagify.whitelist = newWhitelist // ホワイトリストに代入する
          tagify.loading(false).dropdown.show(value) // 関連する結果を表示させる
        })
      }
    }
  }

  