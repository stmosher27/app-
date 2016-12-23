const Game = require("./game.js");
document.addEventListener('DOMContentLoaded',() => {
  const game = new Game();
  window.game = game;
  console.log('woohoo');
});
