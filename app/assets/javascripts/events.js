// Effects for the events on the event list page
function initEventHover() {
  jQuery('.event').hover(
  function() {
    var targetBox = jQuery(this);
    if(targetBox.hasClass('even')) {
        targetBox.removeClass('even');
        targetBox.addClass('even_hover');
      } else {
        targetBox.removeClass('odd');
        targetBox.addClass('odd_hover');
      }
    },
    function() {
      var targetBox = jQuery(this);
      if(targetBox.hasClass('even_hover')) {
        targetBox.removeClass('even_hover');
        targetBox.addClass('even');
      } else {
        targetBox.removeClass('odd_hover');
        targetBox.addClass('odd');
      }
    }
  )
}

// Go to Edit Event Page when you click on an event bubble
function initSubmitEvent() {
  jQuery('.event').each(
    function() {
      jQuery(this).click(
        function() {
          var eventID = jQuery(this).attr('id');
          var formString = 'form.edit_event_form#edit_event_' + eventID;
          jQuery(formString).submit();
        }
      )
    }
  )
}

// Update user status when user status selected for event
function initStatusWatcher() {
  jQuery('select.user_statuses_for_events_status').change(function(){
    //alert('beep');
    var eventID = jQuery(this).attr('id');
    var formString = 'form.update_status_form#edit_event_' + eventID;
    jQuery(formString).submit();
  });
}
