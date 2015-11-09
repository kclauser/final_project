$(document).on("page:change", function()
{
  $('#create-group').on('shown.bs.modal', function () {
    $('#group_name').focus()
  })
});
