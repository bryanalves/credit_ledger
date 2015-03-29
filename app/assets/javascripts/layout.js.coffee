$ () ->
  $('.header_customer_autocomplete').autocomplete(
    source: '/customers/search'
    minlength: 2
    select: (event, ui) ->
      event.preventDefault()
      window.location.href = "/customers/#{ui.item.value}/credit_items"
    focus: (event, ui) ->
      event.preventDefault()
  )
