Array.prototype.bubbleSort = function () {
  let swapped = true;
  let newArr = this.slice();
  while (swapped) {
    swapped = false;
    for (let i = 0; i <= this.length; i++) {
      if (newArr[i] > newArr[i + 1]) {
        [newArr[i + 1], newArr[i]] = [newArr[i], newArr[i+1]];
        swapped = true;
      }
    }
  }
  return newArr;
};


console.log([4,3,2,5,6,8].bubbleSort());

Array.prototype.uniq = function () {
  let newArr = [];
  this.forEach (function (el) {
    if (!newArr.includes(el)) {
      newArr.push(el);
    }
  });
  return newArr;
};

String.prototype.substrings = function () {
  let newArr = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i; j <= this.length; j++) {
      newArr.push(this.slice(i,j));
    }
  }
  return newArr.uniq();
};

console.log("Hello".substrings());
