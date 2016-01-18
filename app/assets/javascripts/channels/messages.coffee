$(document).on 'ready page:load', ->
  $("#scrollmessages").scrollTop($("#messages").prop("scrollHeight"))

App.messages = App.cable.subscriptions.create 'MessagesChannel',
  collection: -> $("[data-channel='messages']")

  connected: ->
    setTimeout =>
      @followCurrentMessage()
      @installPageChangeCallback()
    , 1000

  received: (data) ->

    message = $(data.message)
    if @userIsCurrentUser(message)
      message.addClass('current-user')
    else
      message.addClass('other-user')
      $.notify("Bericht ontvangen!",'success');

    @collection().append(message)
    scrolldown()


  userIsCurrentUser: (message) ->
    message.data('user-id') == parseInt($('meta[name=current-user]').attr('id'))

  followCurrentMessage: ->

    if messageId = @collection().data('message-id')
      @perform 'follow', message_id: messageId
    else
      @perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> App.messages.followCurrentMessage()

scrolldown =  ->
  $("#scrollmessages").animate(
    scrollTop: $("#messages").prop("scrollHeight")
    500
  )