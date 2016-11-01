#Routines Index Page
$(document).on("click", ".show-options-link", ->
  $(this).parent().parent().parent().next(".list-group-item").toggle()
)
