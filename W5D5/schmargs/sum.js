
function sum() {
  let accumulator = 0;
  Array.from(arguments).forEach(el => {
    accumulator += el;
  });

  return accumulator;
}

console.log(
  sum(1, 2, 3, 4) === 10,
  sum(1, 2, 3, 4, 5) === 15
);

function sum(...stuff) {
  let accumulator = 0;
  stuff.forEach(el => {
    accumulator += el;
  });

  return accumulator;
}

console.log(
  sum(1, 2, 3, 4) === 10,
  sum(1, 2, 3, 4, 5) === 15
);
