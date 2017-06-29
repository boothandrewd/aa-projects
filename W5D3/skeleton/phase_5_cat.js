function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function () {
  return `${this.owner} loves ${this.name}`;
};

let tom = new Cat("Tom", "Andy");
let bill = new Cat("Bill", "Nick");

console.log(tom.cuteStatement());
console.log(bill.cuteStatement());

Cat.prototype.cuteStatement = function () {
  return `Everyone loves ${this.name}`;
};

console.log(tom.cuteStatement());
console.log(bill.cuteStatement());

Cat.prototype.meow = function () {
  return "meoooowwwww";
};

console.log(tom.meow());
console.log(bill.meow());

bill.meow = function () {
  return "I don't meow";
};

console.log(tom.meow());
console.log(bill.meow());
