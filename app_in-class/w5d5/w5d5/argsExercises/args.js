function sumRest(...args) {
  let sumVar = 0;
  args.forEach(el => {
    sumVar += el;
  });
  return sumVar;
}

function sumArg() {
  let sumVar = 0;
  let argsArr = Array.prototype.slice.call(arguments);
  argsArr.forEach(el => {
    sumVar += el;
  });
  return sumVar;
}
