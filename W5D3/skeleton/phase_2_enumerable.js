Array.prototype.myEach = function (callback) {
  for (var i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};


console.log([2,4].myEach(function (el) {
  console.log(el * 2);
}));


Array.prototype.myMap = function (callback) {
  let newArr = [];
  for (let i = 0; i < this.length; i++){
    newArr.push(callback(this[i]));
  }
  return newArr;
};

console.log([2,4].myMap(function (el){
  return el * 2;
}));


Array.prototype.myReduce = function (callback, initialValue) {
  let accum = initialValue || 0;

  for (let i = 0; i < this.length; i++) {
    accum = callback(accum, this[i]);
  }

  return accum;
};

console.log([1, 3, 5].myReduce(function(acc, el){
  return acc + el;
}, 2));
