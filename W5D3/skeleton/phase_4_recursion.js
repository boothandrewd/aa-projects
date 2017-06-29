
function range(start, end){
  if (start === end) {
    return [];
  }

  let recResult = range(start + 1, end);
  return [start].concat(recResult);
}

console.log(range(0, 9));


function sumRec(arr){
  if(arr.length < 1){
    return 0;
  }

  let lastEl = arr.pop();
  let recResult = sumRec(arr);
  return recResult + lastEl;
}

console.log(sumRec([1,2,3,4]));

function exponent (base, exp) {
  if (exp === 0) {
    return 1;
  }else if (exp === 1) {
    return base;
  }
  if (exp % 2 === 0) {
    let recResult = exponent(base, Math.floor(exp / 2));
    return recResult * recResult;
  }else {
    let recResult = exponent(base, Math.floor((exp - 1) / 2));
    return base * recResult * recResult;
  }
}

console.log(exponent (3,4));


function fibonacci (n) {

  if (n <= 2) {
    return [0,1].slice(0, n);
  }
  let recResult = fibonacci(n - 1);
  let twoBack = recResult[recResult.length - 2];
  let oneBack = recResult[recResult.length - 1];
  return recResult.concat(twoBack + oneBack);
}

console.log(fibonacci (5));


function bsearch(arr, target) {
  if (arr.length === 1) {
    return -1;
  }

  let middleIdx = Math.floor(arr.length / 2);
  if (target === arr[middleIdx]) {
    return middleIdx;
  } else if (target > arr[middleIdx]) {
    let recResult = bsearch(arr.slice(middleIdx + 1, arr.length), target);
    if (recResult === -1) {
      return -1;
    } else {
      return middleIdx + 1 + recResult;
    }
  } else {
    return bsearch(arr.slice(0, middleIdx), target);
  }
}

console.log(bsearch([0,1,2,3,4,5,6], 30));


function mergesort(arr) {
  if (arr.length <= 1) {
    return arr;
  }

  let middleIdx = Math.floor(arr.length / 2);
  let leftSide = arr.slice(0, middleIdx);
  let rightSide = arr.slice(middleIdx, arr.length);

  return merge(mergesort(leftSide), mergesort(rightSide));
}

function merge(arr1, arr2) {
  let merged = [];
  while (arr1.length > 0 && arr2.length > 0) {
    if (arr1[0] > arr2[0]) {
      merged.push(arr2.shift());
    } else {
      merged.push(arr1.shift());
    }
  }

  return merged.concat(arr1).concat(arr2);
}

console.log(mergesort([2,7,6,5,9,1,3]));

function subsets(arr) {
  console.log(arr);
  if (arr.length === 0) {
    return [[]];
  }
  let recResult = subsets(arr.slice(0,arr.length - 1));
  let newArr = [];
  for (let i = 0; i < recResult.length; i++) {
    newArr.push(recResult[i].concat(arr[arr.length - 1]));
  }
  return recResult.concat(newArr);
}

console.log("\n\n\n\n\n\n");
console.log(subsets([1,2,3]));
