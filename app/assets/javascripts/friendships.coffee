# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
  $("#user-search, #add_friends").sortable(
    items: "li:not(.unsortable)"
    connectWith: ".connectedSortable",
    receive:  ( event, ui ) ->
      $.ajax(
        method: 'POST'
        url: $(this).data('url')
        data: {friend_id: $(ui.item[0]).data('id')}
      ).success( (data) ->
        $('#my-friends').append(data.html)
      ).error((data) ->
        $(ui.sender).append(ui.item[0])
        html = $(data.responseText)
        html.css('display', 'block')
        html.slideDown 'slow', ->
          setTimeout("$('.alert-success, .alert-warning, .alert-info' ).slideUp('slow')", 5000)
        $('#my-flash').append(html)
      )
  ).disableSelection()