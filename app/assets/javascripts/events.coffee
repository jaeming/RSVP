# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  # Hides notices
  hideNotice = ->
    $notice = $('#notice')
    $notice.fadeOut 'slow'
    return

  setTimeout hideNotice, 3000


  # Location search functionality
  input = document.getElementById('location')
  options = types: [
    'address'
  ]
  autocomplete = new (google.maps.places.Autocomplete)(input, options)
