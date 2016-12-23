function uniq(arr) {
  const uniqArr = [];
  for (let i = 0; i < arr.length; i++) {
    if (uniqArr.length === 0) {
      uniqArr.push(arr[i]);
    }
    if (!uniqArr.includes(arr[i])) {
      uniqArr.push(arr[i]);
    }
  }
  return uniqArr;
}

// console.log(uniq([1,1,2,3,3,4]));

function twoSum(arr) {
  let sumArr = [];

  for (let i = 0; i < arr.length; i++) {
    for (let u = i + 1; u < arr.length; u++) {
      if (arr[i] + arr[u] === 0) {
        sumArr.push([i, u]);
      }
    }
  }
  return sumArr;
}

// console.log(twoSum([1,-1,2,0,0,]));


function transpose(arr) {
  let transposedArr = [];
  for (let i = 0; i < arr[0].length; i++) {
    let temp = [];
    for (let u = 0; u < arr.length; u++) {
      temp.push(arr[u][i]);
    }
    transposedArr.push(temp);
  }
  return transposedArr;
}

// // console.log(transpose([
//   [1,2,3],
//   [3,4,5],
// ]));

Array.prototype.myEach = function (func){
  for (let i = 0; i < this.length; i++){
    func(this[i]);
  }
  return this;
};

//
// [1,23,3].myEach((el) => {
//   console.log(el);
// });

Array.prototype.myMap = function (funct) {
  let mappedArray = [] ;
  this.myEach(el => {
    mappedArray.push(funct(el)) ;
  }) ;
  console.log(mappedArray) ;
};

// [1,2,3].myMap(addOne);

function addOne(el) {
  return el + 1 ;
}

Array.prototype.myInject = function (funct) {
  let accum = this[0] ;
  this.slice(1).myEach(el => {
    accum = funct(el, accum) ;
  });
  return accum ;
};

const injected = [1,2,3].myInject((el, accum) => {
  accum += el ;
  return accum;
});

// console.log(injected);


function bubbleSort(arr) {
  let sorted = true ;
  while (sorted) {
    sorted = true ;
    for (let i = 0; i < arr.length - 1; i++) {
      if (arr[i] > arr[i + 1]) {
        let temp = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = temp;
        sorted = false ;
      }
    }
  }
  return arr;
}

// console.log(bubbleSort([3,1,6,4])) ;

function substrings(str) {
  let subs = [];
  for (let i = 0; i < str.length; i++) {
    for (let u = i; u < str.length; u++) {
      subs.push(str.slice(i, u+1));
    }
  }
  console.log(subs);
}

// substrings("cat");



// console.log(range(2,6));

function exponentiation(base, ex) {
  if (ex === 0) {
    return 1 ;
  }
  if (ex === 1 ) {
    return base ;
  }
  if (ex === -1) {
    return (1.0/ base) ;
  }

  if (ex < 0) {
    return (1/ base) * ( exponentiation(base, ex + 1))  ;
  }
  else {
    return base * exponentiation(base, ex - 1) ;
  }
}

// console.log(exponentiation(2,-3)) ;

function fibonacci(n) {
  if (n === 1) {
    return [1];
  }
  if (n ===2) {
    return [1, 1];
  }
  let prev = fibonacci(n-1);

  return prev.concat([prev[prev.length-1] + prev[prev.length-2]]);
}

// console.log(fibonacci(7));

function binarySearch(array, target) {

  if (array.length === 1 && array[0] !== target) {
    return null ;
  }
  if (array.length === 1 &&  array[0] === target) {
    return 0;
  }

  let midEl = array[Math.ceil(array.length / 2)] ;
  let middle = Math.ceil(array.length / 2);

  if (midEl < target) {
    if ( binarySearch(array.slice(middle)) !== null) {
       return middle + binarySearch(array.slice(middle), target) ;
    }
  } else if (midEl > target) {
      return binarySearch(array.slice(0, middle), target) ;
  } else {
     return middle;
  }
}

// console.log(binarySearch([1, 3, 4, 5, 9], 2));
// console.log(binarySearch([2, 3, 4, 5], 3));
// console.log(binarySearch([2, 4, 6, 8, 10], 6));
// console.log(binarySearch([1, 3, 4, 5, 9], 5));
// console.log(binarySearch([1, 2, 3, 4, 5, 6], 5));
// console.log(binarySearch([1, 2, 3, 4, 5, 6], 0));


function mergeSort(array) {
  if (array.length === 0) {
    return [];
  }

  if (array.length === 1){
    return array;
  }

  let mid = Math.ceil(array.length / 2);

  let left = array.slice(0, mid);
  let right = array.slice(mid);

  return merge(mergeSort(left), mergeSort(right));
}

function merge(left, right) {
  let arr= [];
  while (left.length > 0 && right.length > 0) {
    if (left[0] > right[0]) {
      arr.push(right.shift());
    } else {
      arr.push(left.shift());
    }
  }
  return arr.concat(left).concat(right);
}

// console.log(mergeSort([1,2,5,72,4,6]));

function subsets(array) {
  if (array.length < 1) {
    return [[]] ;
  }

  const firstEl = array[0];
  const subs = subsets(array.slice(1));

  const newSubs = subs.map(sub => [firstEl].concat(sub));

  return subs.concat(newSubs);
}

console.log(subsets([1,2,3]));
