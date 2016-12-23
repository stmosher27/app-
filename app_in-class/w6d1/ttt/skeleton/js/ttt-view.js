class View {
  constructor(game, $el) {
    this.game = game;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    $("li").on("click", event => {
      this.makeMove($(event.currentTarget));
    });
  }

  makeMove($square) {
    try {
      this.game.playMove($square.data("pos"));
      if (this.game.currentPlayer === 'o') {
        $square.addClass("o");
      } else {
        $square.addClass("x");
      }
      if (this.game.isOver() && this.game.winner()) {
        alert(`Congrats! ${this.game.currentPlayer} won!`);
        if (this.game.currentPlayer === 'x') {
          $('.x').addClass('win');
          $('.o').addClass('lose');
        } else {
          $('.o').addClass('win');
          $('.x').addClass('lose');
        }
      } else if (this.game.isOver()){
        alert('Cats game!');
        $('li').css("color", "red");
      }
    } catch(e) {
      alert("Invalid!");
    }

  }

  setupBoard() {
    const $ul = $("<ul></ul>");
    $(".ttt").html($ul);
    for (let i = 0; i < 3; i++){
      for (let j = 0; j < 3; j++) {
        let $li = $("<li></li>");
        $li.data("pos", [i, j]);
        $("ul").append($li);
      }
    }
  }
}



module.exports = View;
