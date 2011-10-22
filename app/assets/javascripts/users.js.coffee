$ ->
    #temp debug stuff
    Pusher.log = (message) ->
      if window.console and window.console.log
        window.console.log message
    WEB_SOCKET_DEBUG = true;
    
    #ask listener
    pubListeners = ->
        $('button.ask').bind 'click', ->
            $.post(
                '/users/ask'
                num: new Date().getTime()
                -> console.log "complete"
            )
        
    #listen for questions
    subscribeListeners = ->
        pusher =  new Pusher '40efb27cae6cf315fd28'
        askChannel = pusher.subscribe 'ask_channel'
        askChannel.bind 'question', (num) -> $('.question').html "Can you count to #{num}?"
        
    #load
    load = ->
        pubListeners()
        subscribeListeners()
    load()