# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "page:change", ->
  $("#my-awesome-dropzone").dropzone()

$(document).on 'ready page:load', ->
  $(document).on 'click', '#contacts-table tbody tr', ->
    link = $(this).data('href')
    console.log("test")
    Turbolinks.visit(link)
    return
  $(document).on 'click', '#contacts-table tbody tr a', (e)->
    e.stopPropagation()

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
        $("#testtest").html('')
        $.each(msg, (index, item) ->
          link = $('<a>')
          link.attr('href', '/contacts/' + item.id)
          link.html("<img class='img-circle img-responsive si' src='" + item.avatar.url + "'>" +
                    "<div class='st'>"  +
                      ' ' + item.name + '<br>' + item.email +
                    "</div>").addClass('list-group-item')
          $("#testtest").append(link)
        )
        $("#testtest").collapse('show')
    else
      $("#testtest").html('').collapse('hide')

  $(document).on 'click', ->
    $("#testtest").html('').collapse('hide')

  $('.add_child').click ->
    association = $(this).attr('data-association')
    target = $(this).attr('target')
    regexp = new RegExp('new_' + association, 'g')
    new_id = (new Date).getTime()
    Dest = if target == '' then $(this).parent() else $('#' + target)
    Dest.append window[association + '_fields'].replace(regexp, new_id)
    addValidator()
    false

  $(document).delegate '.remove_child', 'click', ->
    if $(this).closest('.address').children('.removable')[0]
      $(this).closest('.address').children('.removable')[0].value = 1
    $(this).closest('.address').hide()
    return

addValidator = ->
  $(".edit_contact :input").on 'blur', (e)->
    unless e.target.validity.valid
      $(this).css('border', '1px solid red')
      $(this).next('.help-block').show()
    else
      $(this).css('border', '1px solid #ccc')
      $(this).next('.help-block').hide()
  $(".edit_contact :input").on 'invalid', (e)->
    errorMessage = $(this).data("error")
#    e.target.setCustomValidity("")
 #   e.target.setCustomValidity("test") unless e.target.validity.valid