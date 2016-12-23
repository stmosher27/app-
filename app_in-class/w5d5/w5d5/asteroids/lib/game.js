const Asteroid = require("./asteroid.js");

function Game() {
  this.DIM_X = 800;
  this.DIM_Y = 800;
  this.NUM_ASTEROIDS = 5;
  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.randomPosition = function () {
  const randX = Math.floor(Math.random() * this.DIM_X);
  const randY = Math.floor(Math.random() * this.DIM_Y);
  return [randX, randY];
};

Game.prototype.addAsteroids = function () {
  while (this.asteroids.length < this.NUM_ASTEROIDS) {
    this.asteroids.push(new Asteroid({ pos: this.randomPosition() }));
  }
};

module.exports = Game;
