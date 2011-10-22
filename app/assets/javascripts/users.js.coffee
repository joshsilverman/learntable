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
        askChannel.bind 'question', (question) ->
            answers = [question.answer, question.first_wrong_answer, question.second_wrong_answer, question.third_wrong_answer]
            $('.question').html question.name
            shift_it = (arr) ->
                temp = arr.shift()
                arr.push(temp)
            display_answer = (arr, num) ->
                $(".answer[answer_num=#{num}]").html arr[num]
            rando = Math.floor(Math.random()*4)
            shift_it answers for num in [0..rando]
            display_answer answers, num for num in [0..3]
            @correct_answer = Math.abs(rando-3)
            
            console.log @correct_answer
            console.log answers
            
    #checkin every n seconds
    checkin = ->
        $.get(
            "/users/checkin"
            (active_ids) ->
                old_ids = $(".student").map (i, elmnt) ->
                    parseInt($(elmnt).attr 'user_id')
                #add new
                $.each active_ids, (i, active_id) ->
                    if ($.inArray active_id, old_ids) == -1 
                        $('.student_barrier').append "<div class='student boy' user_id='#{active_id}'>#{active_id}</div>"
                #remove old
                $.each old_ids, (i, old_id) ->
                    if ($.inArray old_id, active_ids) == -1 
                        $(".student[user_id=#{old_id}]").remove()
                positionStudents()
                
        )
        
    #position student
    positionStudents = ->
        $('.student').each (i, elmnt) ->
            rando = Math.floor(Math.random()*171)
            $(elmnt).css("left", 100 % ((i + 1) * 80))
        
    #load
    load = ->
        positionStudents()
        pubListeners()
        subscribeListeners()
        setInterval(checkin, 2500)
    load()