# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  hideNotice = ->
    $notice = $('.notice')
    $notice.slideUp 'slow'
    return

  setTimeout hideNotice, 3000
  return
