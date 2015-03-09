$('a[data-row-link]').closest('tr').css('cursor', 'pointer').click ->
  $(this).find('a[data-row-link]')[0].click()