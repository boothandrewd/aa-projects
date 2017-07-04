Function.prototype.inherits = function (parent) {
  function Surrogate () {}
  Surrogate.prototype = parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

function MovingObject (position, speed) {
  this.position = position;
  this.speed = speed;
}
MovingObject.prototype.move = function () {
  console.log('the thing moves!');
};

function Ship (position, speed) {
  MovingObject.apply(this, Array.from(arguments));
}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);
Asteroid.prototype.madeOfIce = function () {
  console.log("I'm made of ice");
};

let movingObject = new MovingObject(0, 20);
try {
  movingObject.madeOfIce();    // Should through error
} catch (e) {
  console.log(e);
}

let ship = new Ship(0, 100);
console.log(ship.speed);
ship.move();
