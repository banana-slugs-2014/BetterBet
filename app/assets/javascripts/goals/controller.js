BetterBet.Goals.Controller = function(view){
  this.view = view;
}

BetterBet.Goals.Controller.prototype = {
  deleteGoal: function(goalId){
    $.ajax({
      url: '/goals/' + goalId,
      type: 'DELETE',
      context: this,
      data: {id: goalId}
    }).done(function(){
      this.view.removeGoal(goalId);
    }).fail(function(xhr){
      this.view.goalErrorAlert(xhr, goalId);
    });
  }
}