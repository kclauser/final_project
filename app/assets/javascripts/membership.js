
$(document).on("page:change", function() {
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

  // The reason we have to put the click handler on the main
  // is that we replace the entire group in ajax and thus
  // the newly inserted .delete-membership elements wouldn't
  // have the hander. By putting the handler on the parent
  // and then scoping the class inside the click, we don't
  // have to worry about this.
  $(".main").on("click", ".delete-membership", function(event) {
    // Get the membership id
    var membership_id = $(this).data("membership-id");

    // TODO: do we want some kind of confirmation?

    // Request a delete of this membership
    $.ajax('/memberships/' + membership_id,
      {
        type: "POST",
        data: { _method: "DELETE" }
      });
  });
})
