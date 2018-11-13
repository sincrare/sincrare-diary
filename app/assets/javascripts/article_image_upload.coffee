$ ->
  if $('#upload-dropzone').length
    Dropzone.autoDiscover = false

    new Dropzone '#upload-dropzone',
      uploadMultiple: false
      paramName: 'article_image[image]'
      params: 'article_image[article_id]': $('#article_id').val()
      init: ->
        @on 'success', (file, response) ->
          $('#article_content').val($('#article_content').val() + "\n[img:#{response.article_image_id}]")
          # ここで form に input_field を付け足しておくと、ひも付きができる
      dictDefaultMessage: '''
        <i class="fa fa-file-o fa-2x"></i><br>
        <br>
        ファイルをここにドロップするか<br>
        ここをクリックして下さい
      '''

