class View {
  constructor(game, $el) {
    this.game = game;
    this.setupBoard();
    this.bindEvents();

  }

  bindEvents() {
    $("ul").on("click", event => {
      this.makeMove($(event.currentTarget));
    });
  }

  makeMove($tower) {
    try {
      this.game.move(startTower, endTower);
    } catch(e) {
      alert("Invalid!");
    }
  }

  setupBoard() {
    for (let j = 0; j < 3; j++) {
      let $ul = $("<ul></ul>");
      $('.toh').append($ul);
    }
    const $ulItems = $("ul");
    let count = 0;
    $ulItems.each(function(ul) {
      $(ul).data("tower", count);
      $("ul").append($('<li></li>'));
      count++;
    });
    const ul0 = $ulItems[0];
    $(ul0).children('li').each(function(index, li) {
      $(li).addClass(`Disk-${index + 1}`);
    });
  }
}

module.exports = View;
