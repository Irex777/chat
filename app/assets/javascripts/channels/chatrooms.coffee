 App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_chatroom = $("[data-behavior='messages'][data-chatroom-id='#{data.chatroom_id}']")
    if active_chatroom.length > 0
      active_chatroom.append("<div class='panel panel-info'><div class='panel-heading'><h3 class='panel-title'>User <strong>#{data.username}</strong> wrote:</h3></div><div class='panel-body'>#{data.body}</div></div>")

      if document.hidden && Notification.permission == "granted"
        new Notification(data.username, {body: data.body})

    else
      $("[data-behavior='chatroom-link'][data-chatroom-id='#{data.chatroom_id}']").css("font-weight", "bold")

  send_message: (chatroom_id, message) ->
    @perform "send_message", {chatroom_id: chatroom_id, body: message}
