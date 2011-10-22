$ ->
    #temp debug stuff
    Pusher.log = (message) ->
      if window.console and window.console.log
        window.console.log message
    WEB_SOCKET_DEBUG = true;
    
    #publish listener
    pubListeners = ->
        $('.answer').bind 'click', (elmnt) ->
            $.post(
                '/users/answer'
                question: 
                    response_num: 1
                    id: 1
                -> console.log "complete"
            )
        
    #listen for questions
    subscribeListeners = ->
        pusher =  new Pusher '40efb27cae6cf315fd28'
        askChannel = pusher.subscribe 'ask_channel'
        askChannel.bind 'question', (num) -> $('.question').html "Can you count to #{num}?"
        
    #checkin every n seconds
    checkin = ->
        $.get(
            "/users/checkin"
            (active_ids) ->
                console.log "checked in"
                old_ids = $(".person").map (i, elmnt) ->
                    parseInt($(elmnt).attr 'user_id')
                console.log old_ids
                console.log active_ids
                #add new
                $.each active_ids, (i, active_id) ->
                    if ($.inArray active_id, old_ids) == -1 
                        console.log "add #{active_id}"
                        $('.classroom').append "<div class='person' user_id='#{active_id}'>#{active_id}</div>"
                #remove old
                $.each old_ids, (i, old_id) ->
                    if ($.inArray old_id, active_ids) == -1 
                        console.log "remove #{old_id}"
                        $(".person[user_id=#{old_id}]").remove()
        )
        
    #load
    load = ->
        pubListeners()
        subscribeListeners()
        setInterval(checkin, 1000)
    load()