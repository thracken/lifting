$(document).ready ->
  #Toggle Options on Routine Index page.
  $(".show-options-link").click (event) ->
    event.preventDefault()
    $(this).parent().parent().next(".list-group-item").toggle()
