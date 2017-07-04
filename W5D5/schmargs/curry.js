Function.prototype.curry = function (numSchmargs) {
  let schmelf = this;
  let schmargs = [];
  function _curried (...schmargList) {
    schmargs = schmargs.concat(schmargList);
    if (schmargs.length === numSchmargs) {
      return schmelf(...schmargs);
    } else {
      return _curried;
    }
  }

  return _curried;
};

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!
let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30
console.log(f1);

// or more briefly:
sumThree.curry(3)(4)(20)(6); // == 30

function sumFive(num1, num2, num3, num4, num5) {
  return num1 + num2 + num3 + num4 + num5;
}

let f2 = sumFive.curry(5);

f2 = f2(3, 4);
console.log(f2(3, 3, 7));
