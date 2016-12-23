class Cat {
  constructor(name, owner) {
    this.name = name;
    this.owner = owner;
  }
}

Cat.prototype.cuteStatement = function () {
  return `${this.owner} loves ${this.name}.`;
};

Cat.prototype.cuteStatement = function () {
  return `Everyone loves ${this.name}!`;
};

Cat.prototype.meow = function () {
  return "meow!!!!";
};

let jerry = new Cat('jerry', 'bill');

console.log(jerry.cuteStatement());

console.log(jerry.meow());

jerry.meow = function () {
  return "GRRR!!";
};

console.log(jerry.meow());

class Student {
  constructor(fname, lname) {
    this.fname = fname;
    this.lname = lname;
    this.courses = [];
  }
}

Student.prototype.name = function () {
  return `${this.fname} ${this.lname}`;
};

let alberto = new Student('alberto', 'manonela');

console.log(alberto.name());

Student.prototype.enroll = function (course) {
  this.courses.push(course);
};

alberto.enroll('janitorial management');

console.log(alberto.courses);
