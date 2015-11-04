
$(function()
{
  // Friends are draggable
  $(".friendlist li").draggable({revert: true});

  // Groups are droppable
  $(".group-container").droppable({
      drop: function(event, ui) {
        var group_id = $(this).data("group-id");
        var user_id  = $(ui.draggable).data("user-id");

        // Do an ajax call to add a membership between
        // user_id and group_id

        $.ajax('/memberships',
          {
            type: 'POST',
            data: {
              user_id: user_id,
              group_id: group_id
            }
          });

        console.log("dragging from " + user_id + " to " + group_id);
      }
  });
})
