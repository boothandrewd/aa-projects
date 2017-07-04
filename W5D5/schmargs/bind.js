Function.prototype.myBind = function () {
  // Because of line 6, we have to locally store references to
  //  `this` and `arguments`.
  let self = this;
  let bindArgs = Array.from(arguments);
  console.log(`Bind time arguments: ${bindArgs}`);

  return function () {
    console.log(`Call time arguments: ${Array.from(arguments)}`);
    // Within new function, `this` and `arguments` changes
    let args = bindArgs.concat(Array.from(arguments));
    console.log(`Full arg list: ${args}`);
    return self.apply(args[0], args.slice(1));
  };
};

Function.prototype.myBind = function (...bindArgs) {
  // Because of line 6, we have to locally store references to
  //  `this` and `arguments`.
  let self = this;
  return function (...callArgs) {
    // Within new function, `this` and `arguments` changes
    let args = bindArgs.concat(callArgs);
    return self.apply(args[0], args.slice(1));
  };
};

Function.prototype.myBind = function (...bindArgs) {
  return (...callArgs) => this.call(...bindArgs.concat(callArgs));
};

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
console.log('\n\n\n\n\n');
// markov.says.myBind(breakfast, "meow", "Kush")();
let boundSays = markov.says.myBind(breakfast, "meow", "Kush");
boundSays();
// Breakfast says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "me"
console.log('\n\n\n\n\n');
// markov.says.myBind(breakfast)("meow", "a tree");
boundSays = markov.says.myBind(breakfast);
boundSays("meow", "a tree");
// Breakfast says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
console.log('\n\n\n\n\n');
// markov.says.myBind(breakfast, "meow")("Markov");
boundSays = markov.says.myBind(breakfast, "meow");
boundSays("Markov");
// Breakfast says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
console.log('\n\n\n\n\n');
const notMarkovSays = markov.says.myBind(breakfast);
notMarkovSays("meow", "me");
// Breakfast says meow to me!
// true
