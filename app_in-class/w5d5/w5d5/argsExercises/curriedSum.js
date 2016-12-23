function curriedSum(numArgs) {
  const numbers = [];
  function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      let sum = 0;
      numbers.forEach(el => { sum += el; });
      return sum;
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

let f1 = curriedSum(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30


// Function.prototype.curryArgs = function (numArgs) {
//   const numbers = [];
//   const that = this;
//   function _curried(arg) {
//     numbers.push(arg);
//     if (numbers.length === numArgs) {
//       return that.apply(null, numbers);
//     } else {
//       return _curried;
//     }
//   }
//   return _curried;
// };

const newFunc = function (...args) {
  console.log(args);
};


Function.prototype.currySpread = function (numArgs) {
  let numbers = [];
  const that = this;
  function _curried(...args) {
    numbers = numbers.concat(args);
    if (numbers.length === numArgs) {
      return that.apply(null, numbers);
    } else {
      return _curried;
    }
  }
  return _curried;
};

newFunc.currySpread(3)(1, 3, 5);
