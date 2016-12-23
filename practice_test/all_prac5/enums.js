Array.prototype.uniq = function () {
  const uniqArr = [];
  this.forEach( el => {
    if (uniqArr.indexOf(el) === -1)
      uniqArr.push(el);
  });
  return uniqArr;
};

// console.log([1,2,3,3,4,2,1].uniq());

Array.prototype.twoSum = function () {
  const twoArr = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0)
        twoArr.push([i,j]);
    }
  }
  return twoArr;
};

// console.log([1,0,2,-2,0,-1].twoSum());

Array.prototype.myTranspose = function () {
  const transArr = [];
  for (let i = 0; i < this[0].length; i++) {
    let temp = [];
    for (let j = 0; j < this.length; j++) {
      temp.push(this[j][i]);
    }
    transArr.push(temp);
  }
  return transArr;
};

let rows = [
    [0, 1],
    [3, 4],
    [6, 7]
  ];

// console.log(rows.myTranspose());

Array.prototype.myEach = function (func) {
  for (let i = 0; i < this.length; i++) {
    func(this[i]);
  }
  return this;
};

Array.prototype.myMap = function (func) {
  const mappedArray = [];
  this.myEach(el => {
    mappedArray.push(func(el));
  });
  return mappedArray;
};

// console.log([1,2,3].myMap(addOne));

function addOne(el) {
  return el + 1;
}

Array.prototype.mySlice = function (start, end = this.length) {
  let sliced = [];
  for (let i = start; i < end; i++) {
    sliced.push(this[i]);
  }
  return sliced;
};

///////////////only does + (BAD!!!)
// Array.prototype.myInject = function () {
//   let accum = this[0];
//   this.slice(1).myEach(el => {
//     accum += el;
//   });
//   return accum;
// };
//
// // console.log([1,2,3].myInject());
////////////// their answer DO THIS!!!!!!! accounts for multiply and other
////////operators

Array.prototype.theirInject = function (func) {
  let accum = this[0];
  this.slice(1).myEach(el => {
    accum = func(accum, el);
  });
  return accum;
};

// console.log([1,2,4].theirInject((accum, item) => accum * item));



function subStrings(str) {
  let subs = [];
  for (let i = 0; i < str.length; i++) {
    for (let j = i; j < str.length; j++) {
      subs.push(str.slice(i, j+1));
    }
  }
  return subs;
}

console.log(subStrings('cat'));
