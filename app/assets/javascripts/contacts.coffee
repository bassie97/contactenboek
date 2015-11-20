# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
  $(document).on 'click', '#contacts-table tr', ->
    link = $(this).data('href')
    Turbolinks.visit(link)
    return

  $(document).on 'click', '#collapse li', ->
    link = $(this).data('href')
    Turbolinks.visit(link)
    return

  Dropzone.options.myAwesomeDropzone =
    paramName: "file",
    maxFilesize: 2,
    success: (file, done) ->
      $('#profile thead th img').attr('src', done.avatar.url)

  $("input[name='info']").on 'keyup', ->
    if $(this).val() != ''
      $.ajax(
        method: 'GET'
        url: 'contacts.json'
        data: q: $("input[name='info']").val())
      .done (msg) ->
        console.log msg
        $(".collapse").html('')
        $.each(msg, (index, item) ->
          link = $('<a>')
          link.attr('href', '/contacts/' + item.id)
          link.html(item.name + ' ' + item.email).addClass('list-group-item')

          $(".collapse").append(link)
        )
        $(".collapse").collapse('show')
    else
      $(".collapse").html('').collapse('hide')