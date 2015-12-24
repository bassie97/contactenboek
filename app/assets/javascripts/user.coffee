# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->

  $("input[name='users']").on 'keyup', ->
    if $(this).val() != ''
      $.ajax(
        method: 'GET'
        url: '/users.json'
        data: q: $("input[name='users']").val())
      .done (msg) ->
#        console.log msg
        $("#user-search").html('')
        $.each(msg, (index, item) ->
          li = $('<li>')
          li.html("<img class='img-circle img-responsive si' src='" + item.avatar.url + "'>" +
              "<div class='st'>"  +
              ' ' + item.name + '<br>' + item.email +
              "</div>")
          li.addClass('list-group-item')
          li.attr("data-id", item.id)
          $("#user-search").append(li)
        )
        $("#user-search").collapse('show').sortable('refresh')
        $('#add_friends').sortable('refresh')
    else
      $("#user-search").html('').collapse('hide')