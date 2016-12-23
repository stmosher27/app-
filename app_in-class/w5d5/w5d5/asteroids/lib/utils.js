const Util = {
  inherits (childClass, parentClass) {
    const Surrogate = function (){};
    Surrogate.prototype = parentClass.prototype;
    childClass.prototype = new Surrogate();
    childClass.prototype.constructor = childClass;
  },

  randomVec(length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },

  norm(pos) {
    return Math.sqrt(Math.pow(pos[0], 2) + Math.pow(pos[1], 2));
  },

  scale(vec, m) {
    return [vec[0] * m, vec[1] * m];
  }
};

module.exports = Util;
