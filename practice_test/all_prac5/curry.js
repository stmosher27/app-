Function.prototype.curry = function (numArgs) {
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

console.log();

Function.prototype.curry = function(numOfArgs) {
  let nums = [];
  const that = this;
  function _curried(...args) {
    nums = nums.concat(args);
    if (nums.length === numOfArgs) {
      return that.apply(null, nums);
    } else {
      return _curried;
    }
  }
  return _curried;
};

Function.prototype.curryArgs = function (numsOfArgs) {
  let nums = [];
  const that = this;
  function _curried(...args) {
    nums.concat(args);
    if (nums.length === numsOfArgs) {
      return that.apply(null,nums);
    } else {
      return _curried;
      }
    }
    return _curried;
  }

};
