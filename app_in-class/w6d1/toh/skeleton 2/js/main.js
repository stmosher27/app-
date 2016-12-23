const Game = require("/Users/appacademy/Desktop/w6d1/toh/solution/game.js");
const View = require("./toh-view.js");

$( () => {
  const rootEl = $('.toh');
  const game = new Game();
  new View(game, rootEl);
});
