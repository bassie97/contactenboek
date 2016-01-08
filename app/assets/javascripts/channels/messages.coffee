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
    console.log(data)

    message = $(data.message)
    if @userIsCurrentUser(message)
      message.addClass('current-user')
    else
      message.addClass('other-user')
      $.notify("Bericht ontvangen!",'notice');

    @collection().append(message)
    scrolldown()


  userIsCurrentUser: (message) ->
    console.log("user is current user")
    message.data('user-id') == parseInt($('meta[name=current-user]').attr('id'))

  followCurrentMessage: ->
    console.log("follow current message")

    if messageId = @collection().data('message-id')
      console.log(messageId + "messageId")
      @perform 'follow', message_id: messageId
      console.log("follow")
    else
      @perform 'unfollow'
      console.log(messageId + "messageId")
      console.log("unfollow")

  installPageChangeCallback: ->
    console.log("page change call back")
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> App.messages.followCurrentMessage()

scrolldown =  ->
  $("#scrollmessages").animate(
    scrollTop: $("#messages").prop("scrollHeight")
    3000
  )