const MovingObject = require("./movingObjects.js");
const Util = require("./utils.js");

function Asteroid(options) {
  options.color = 'grey';
  options.radius = 10;
  options.vel = Util.randomVec(Util.norm(options.pos));
  MovingObject.call(this, options);
}

module.exports = Asteroid;
