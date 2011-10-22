$ ->
    Pusher.log = (message) ->
      if window.console and window.console.log
        window.console.log message

    WEB_SOCKET_DEBUG = true;

    pusher =  new Pusher '40efb27cae6cf315fd28'
    channel = pusher.subscribe 'test_channel'
    channel.bind 'my_event', (data) ->
      alert data