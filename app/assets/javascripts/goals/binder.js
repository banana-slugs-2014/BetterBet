BetterBet.Goals.Binder = function(controller, selectors){
  this.controller = controller;
  this.selectors = selectors;
}

BetterBet.Goals.Binder.prototype = {
  bindEvents: function(){
    this.bindDelete();
  },

  bindDelete: function(){
    var controller = this.controller;
    $(this.selectors.deleteGoal).on('click', function(e){
      e.preventDefault();
      var goalId = $(this).data('goal');
      if (confirm("Are you sure?")){
        controller.deleteGoal(goalId);
      }
    });
  }
}