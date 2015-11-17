# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
  $(document).on 'click', '#contacts-table tr', ->
    link = $(this).data('href')
    Turbolinks.visit(link)
    return