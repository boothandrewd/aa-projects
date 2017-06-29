Array.prototype.uniq = function () {
  let newArr = [];
  this.forEach (function (el) {
    if (!newArr.includes(el)) {
      newArr.push(el);
    }
  });
  return newArr;
};

console.log([2,3,3,3].uniq());


Array.prototype.twoSum = function() {
  let newArr = [];
  for (let i = 0; i < this.length - 1; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        newArr.push([i, j]);
      }
    }
  }

  return newArr;
};

console.log([1, 3, 4, -3, -1].twoSum());

Array.prototype.transpose = function() {
  let newMat = [];
  for(let colIdx = 0; colIdx < this[0].length; colIdx++) {
    let newRow = [];
    for(let rowIdx = 0; rowIdx < this.length; rowIdx++) {
      newRow.push(this[rowIdx][colIdx]);
    }
    newMat.push(newRow);
  }

  return newMat;
};

console.log([ [ 1, 2, 7], [ 3, 4, 7], [ 5, 6, 7] ].transpose());
