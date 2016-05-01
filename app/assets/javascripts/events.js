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
