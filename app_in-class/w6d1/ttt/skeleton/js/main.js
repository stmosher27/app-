const View = require("./ttt-view.js");// require appropriate file
const Game = require("/Users/appacademy/Desktop/w6d1/solution/game.js");// require appropriate file

$( () => {
  // Your code here
  const game = new Game();
  new View(game, $('.ttt'));
});
