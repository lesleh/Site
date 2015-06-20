/// <reference path="jquery.d.ts" />

$('a[data-row-link]').closest('tr').css('cursor', 'pointer').click(function() {
    $(this).find('a[data-row-link]')[0].click()
});
