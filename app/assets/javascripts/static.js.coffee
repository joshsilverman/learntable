# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
    choice = 0
    console.log $('#loginbtn')
    $('#loginbtn').bind 'click', (event) -> 
        window.location.href = "http://localhost:3000/auth/facebook"
        
    $('.answer').click( (e) =>
        @choice = $(e.target).attr('answer_id')
        console.log @choice)
    
    $('.room_name').click( (e) => console.log @choice)