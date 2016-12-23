
// write String.prototype.mySlice. It should take a start index and an
// (optional) end index.
String.prototype.mySlice = function(start, end) {
  let slice = "";

  if (typeof end === 'undefined') {
    end = this.length;
  }

  for (let i = start; i < end && i < this.length; i++) {
    slice += this[i];
  }
  return slice;
};

// write Array.prototype.myReduce (analogous to Ruby's Array#inject).
Array.prototype.myReduce = function(callback) {
  let accum = this[0];

  this.slice(1).forEach((el) => {
    accum = callback(accum, el);
  });

  return accum;
};

// write Array.prototype.quickSort(comparator). Here's a quick refresher if
// you've forgotten how quickSort works:
//   - choose a pivot element from the array (usually the first)
//   - for each remaining element of the array:
//     - if the element is less than the pivot, put it in the left half of the
//     array.
//     - otherwise, put it in the right half of the array.
//   - recursively call quickSort on the left and right halves, and return the
//   full sorted array.
Array.prototype.quickSort = function (comparator) {
  if (this.length <= 1) return this;

  if (typeof comparator !== "function") {
    comparator = (x, y) => {
      if (x === y) {
        return 0;
      } else if (x < y) {
        return -1;
      } else {
        return 1;
      }
    };
  }

  const pivot = this[0];
  const left = [];
  const right = [];

  for (let i = 1; i < this.length; i++) {
    if (comparator(this[i], pivot) === -1) {
      left.push(this[i]);
    } else {
      right.push(this[i]);
    }
  }

  return left.quickSort(comparator).
    concat([pivot]).
    concat(right.quickSort(comparator));
};

// write myFind(array, callback). It should return the first element for which
// callback returns true, or undefined if none is found.
function myFind (array, callback) {
  for (let i = 0; i < array.length; i++) {
    if (callback(array[i])) {
      return array[i];
    }
  }
}

// write sumNPrimes(n)
function sumNPrimes (n) {
  let i = 1;
  let count = 0;
  let sum = 0;

  while (count < n) {
    if (isPrime(i)) {
      count += 1;
      sum += i;
    }
    i += 1;
  }

  return sum;
}

const isPrime = (num) => {
  if (num <= 1) { return false; }

  for (let i = 2; i < num; i++) {
    if (num % i === 0) {
      return false;
    }
  }

  return true;
};

// write Function.prototype.myBind.
Function.prototype.myBind = function (ctx, ...bindArgs) {
  return (...callArgs) => {
    return this.apply(ctx, bindArgs.concat(callArgs));
  };
};

// write Function.prototype.inherits.
Function.prototype.inherits = function(Parent) {
  function Surrogate() {}
  Surrogate.prototype = Parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};
