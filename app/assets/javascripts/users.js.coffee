$ ->
    #temp debug stuff
    Pusher.log = (message) ->
      if window.console and window.console.log
        window.console.log message
    WEB_SOCKET_DEBUG = true;
    
    #attributes
    @correctAnswer = 1
    
    #publish listener
    pubListeners = =>
        $('.answer').bind 'click', (e) =>
            correct = @correctAnswer == parseInt $(e.target).attr("answer_num")
            if correct
                points_inc = 15
                $(e.target).append "<span style='color: green;'> +15 pts!</span>"
            else 
                points_inc = 0
                $(e.target).append "<span style='color: red;'> Wrong!</span>"
            $.post(
                '/users/answer'
                question: 
                    points_inc: points_inc
                    id: 1
                -> console.log points_inc
            )
        
    #listen for questions
    subscribeListeners = =>
        pusher =  new Pusher '40efb27cae6cf315fd28'
        askChannel = pusher.subscribe 'ask_channel'
        answerChannel = pusher.subscribe 'answer_channel'
        
        answerChannel.bind 'score', (score) ->
            $(".student[user_id=#{score['user_id']}]").addClass "waving"
            $(".student[user_id=#{score['user_id']}]").html "<div class='boysarm'><div>"

        askChannel.bind 'question', (question) =>
            answers = [question.answer, question.first_wrong_answer, question.second_wrong_answer, question.third_wrong_answer]
            $('.question').html question.name
            $(".student").removeClass "waving"
            $(".boysarm").remove()
            
            shift_it = (arr) ->
                temp = arr.shift()
                arr.push(temp)
            display_answer = (arr, num) ->
                $(".answer[answer_num=#{num}]").html arr[num]
            rando = Math.floor(Math.random()*4)
            shift_it answers for num in [0..rando]
            display_answer answers, num for num in [0..3]
            @correctAnswer = Math.abs(rando-3)
            
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
                        $('.student_barrier').append "<div><div class='student boy' user_id='#{active_id}'>#{active_id}</div></div>"
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
            $(elmnt).css("top", 120 % ((17*i + 3) * 33))
            $(elmnt).css("z-index", 120 % ((17*i + 3) * 33))
        
    #load
    load = ->
        positionStudents()
        pubListeners()
        subscribeListeners()
        setInterval(checkin, 2500)
    load()