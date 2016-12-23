Function.prototype.inherits = function(parent) {
  const Surrogate = function() {};
  Surrogate.prototype = parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

function MovingObject () {}

MovingObject.prototype.move = function() {
  console.log("MOVING");
};

function Ship () {}
Ship.inherits(MovingObject);

Ship.prototype.shoot = function() {
  console.log("SHOOTING");
};

function Asteroid () {}
Asteroid.inherits(MovingObject);

Asteroid.prototype.asteroiding = function() {
  console.log("ASTEROIDING");
};


const marlyTheMovingObject = new MovingObject();
const andy = new Asteroid();
const shirleyTheShip = new Ship();

console.log(marlyTheMovingObject.move());
console.log(andy.move());
console.log(shirleyTheShip.move());
console.log(shirleyTheShip.shoot());
// console.log(andy.shoot());
console.log(andy.asteroiding());
