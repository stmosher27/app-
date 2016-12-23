// write String.prototype.mySlice. It should take a start index and an
// (optional) end index.

String.prototype.mySlice = function(start, end = this.length) {
  let sliced = [];
  for (let i = start; i < end; i++) {
    sliced.push(this[i]);
  }
  return sliced.join('');
};

// write Array.prototype.myReduce (analogous to Ruby's Array#inject).

Array.prototype.myReduce = function(func) {
  let accum = this[0];
  this.slice(1).forEach(el => {
    accum = func(accum, el);
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
//

function defaultComp(x,y) {
  if (x < y)
    return -1;
  else
    return 1;
}


Array.prototype.quickSort = function(comparator = defaultComp) {
  if (this.length <= 1) return this;

  let pivot = this[0];
  let left = [];
  let right = [];

  for (let i = 1; i < this.length; i++) {
    if (comparator(this[i], pivot) === -1) {
      left.push(this[i]);
    } else {
      right.push(this[i]);
    }
  }

  return left.quickSort(comparator).concat([pivot]).concat(right.quickSort(comparator));
};

// write myFind(array, callback). It should return the first element for which
// callback returns true, or undefined if none is found.
function myFind(array, cb) {
  for (let i = 0; i < array.length; i++) {
    if (cb(array[i]))
      return array[i];
  }
  return undefined;
}


// write sumNPrimes(n)
function sumNPrimes(n) {
  let sum = 0;
  let posPrime = 2;
  let count = 0;
  while (count < n) {
    if (isPrime(posPrime)) {
      sum += posPrime;
      count++;
    }
    posPrime++;
  }
  return sum;
}

function isPrime(n) {
  if (n < 2) return false;

  for (let i = 2; i < n; i++) {
    if (n % i === 0)
      return false;
  }
  return true;
}

// write Function.prototype.myBind.

Function.prototype.myBind = function(ctx, ...bindArgs) {
  return (...callArgs) => {
    return this.apply(ctx, bindArgs.concat(callArgs));
  };
};

// write Function.prototype.inherits.

Function.prototype.inherits = function(parent) {
  function Surrogate() {}
  Surrogate.prototype = parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};
