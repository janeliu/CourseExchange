jQuery ->
  $('#user_college_name').autocomplete
    source: $('#user_college_name').data('autocomplete-source')
