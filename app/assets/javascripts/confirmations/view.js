Confirmation.View = function(selectors) {
  this.selectors = selectors;
}

Confirmation.View.prototype = {
  showModal: function(goal, friend) {
    $(document).foundation();
    $(this.selectors.buddyname).append(friend)
    $(this.selectors.goal).html(goal.title);
    $(this.selectors.modal).foundation('reveal', 'open');
  },
  hideModal: function() {
    $(this.selectors.modal).foundation('reveal', 'close');
  }
};