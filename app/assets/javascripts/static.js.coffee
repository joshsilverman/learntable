# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
    console.log $('#loginbtn')
    $('#loginbtn').bind 'click', (event) -> 
        window.location.href = "http://localhost:3000/auth/facebook"
    
    
