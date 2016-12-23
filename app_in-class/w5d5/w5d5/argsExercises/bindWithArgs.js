class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

Function.prototype.myBindArg = function() {
  const args1 = Array.prototype.slice.call(arguments);
  // const that = this;(do the same thing minus the bind)
  return function() {
    const args2 = Array.prototype.slice.call(arguments);
    return this.call(...args1, ...args2);
  }.bind(this);
};

Function.prototype.myBindRest = function(...args1) {
  return (...args2) => {
    return this.call(...args1, ...args2);
  };
};


markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBindRest(breakfast, "meow", "Kush")();
// Breakfast says meow to Kush!
// true

// // no bind time args (other than context), call time args are "meow" and "me"
markov.says.myBindRest(breakfast)("meow", "a tree");
// // Breakfast says meow to a tree!
// // true
//
// // bind time arg is "meow", call time arg is "Markov"
markov.says.myBindRest(breakfast, "meow")("Markov");
// // // Breakfast says meow to Markov!
// // // true
// //
// // // no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBindRest(breakfast);
notMarkovSays("meow", "me");
// Breakfast says meow to me!
// true
