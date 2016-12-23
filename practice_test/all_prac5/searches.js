function defaultComp(x,y) {
  if (x < y)
    return -1;
  else
    return 1;
}

Array.prototype.bubbleSort = function(comparator = defaultComp) {
  const sortedArr = [];
  let sorted = false;
  while (!sorted) {
    sorted = true;
    for (let i = 0; i < this.length - 1; i++) {
      if (comparator(this[i], this[i+1]) === 1) {
        let temp = this[i+1];
        this[i + 1] = this[i];
        this[i] = temp;
        sorted = false;
      }
    }
  }
  return this;
};

console.log([2,3,1,4,8,6].bubbleSort());


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

Array.prototype.mergeSort = function(comparator = defaultComp) {
  if (this.length <= 1) return this;

  let mid = (Math.floor(this.length / 2));
  let left = this.slice(0, mid);
  let right = this.slice(mid);

  return merge(left.mergeSort(comparator), right.mergeSort(comparator), comparator);
};

function merge(left, right, comparator) {
  let arr= [];
  while (left.length > 0 && right.length > 0) {
    if (comparator(left[0], right[0]) === 1) {
      arr.push(right.shift());
    } else {
      arr.push(left.shift());
    }
  }
  return arr.concat(left).concat(right);
}



console.log([3,1,2,0].mergeSort());

Array.prototype.binarySearch = function(target) {
  if (this.length <= 1 && this[0] !== target)
    return null;
  if (this.length <= 1 && this[0] === target)
    return 0;

  let mid = Math.floor(this.length/2);
  if (target > this[mid]) {
    let result = this.slice(mid).binarySearch(target);
    return result + mid;
  } else if (target < this[mid]) {
    return this.slice(0, mid).binarySearch(target);
  } else {
    return mid;
  }
};
//
// console.log([1, 3, 4, 5, 9].binarySearch(5));
// console.log([1, 2, 3, 4, 5, 6].binarySearch(0));
