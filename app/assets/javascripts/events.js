// Effects for the events on the event list page
function initEventHover() {
  jQuery('.event').hover(
    function() {
      jQuery(this).addClass('hover_color');
    },
    function() {
      jQuery(this).removeClass('hover_color');
    }
  )
}

// Go to Edit Event Page when you click on an event bubble
function initSubmitEvent() {
  jQuery('.edit_event').each(
    function() {
      jQuery(this).click(
        function() {
          jQuery(this).submit();
        }
      )
    }
  )
}
