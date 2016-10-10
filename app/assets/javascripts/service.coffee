# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

  $(document).ready ->
    $("#new_service").on("ajax:success", (e, data, status, xhr) ->
      $("#add_service").append("<div>").addClass('item').append("<div>").addClass('right floated content').append("<div>").addClass('ui button delete_service').append('<div class="ui button delete_service"><a rel="nofollow" data-method="delete" href="/professionals/2/services/30">Remove</a></div>').append('<i class="pin icon"></i>append').append('<div>').addClass('content').append(e.target[1].value)
    ).on "ajax:error", (e, xhr, status, error) ->
      $("#new_service").append "<p>ERROR</p>"
