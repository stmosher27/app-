function range(start, end) {
  if (start > end) {
    return [];
  }
  if (start === end)
    return [start];

  return range(start, end - 1).concat([end]);
}

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

function subsets(array) {
  if (array.length < 1) {
    return [[]] ;
  }

  const firstEl = array[0];
  const subs = subsets(array.slice(1));

  const newSubs = subs.map(sub => [firstEl].concat(sub));

  return subs.concat(newSubs);
}
