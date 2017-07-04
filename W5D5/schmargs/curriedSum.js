function curriedSum (numArgs) {
  let numbers = [];
  function _curriedSum (num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      let accumulator = 0;
      numbers.forEach( el => {
        accumulator += el;
      });
      return accumulator;
    }
    else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

const sum = curriedSum(4);
console.log(sum(5)(30)(20)(1)); // => 56
