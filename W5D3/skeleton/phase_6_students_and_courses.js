function Student(fname, lname) {
  this.fname = fname;
  this.lname = lname;

  this.courses = [];
}

Student.prototype.name = function () {
  return this.fname + " " + this.lname;
};

Student.prototype.hasConflict = function (course) {
  for (let i = 0; i < this.courses.length; i++) {
    if (this.courses[i].conflictsWith(course)) {
      return true;
    }
  }

  return false;
};

Student.prototype.enroll = function (course) {
  if(!this.hasConflict(course)) {
    course.students.push(this);
    this.courses.push(course);
  } else {
    console.log('Cant add!');
  }
};

function Course (name, dept, creditCount, timeBlock, days) {
  this.name = name;
  this.dept = dept;
  this.creditCount = creditCount;
  this.timeBlock = timeBlock;
  this.days = days;

  this.students = [];
}

Course.prototype.addStudent = function (student) {
  if (!this.students.includes(student)){
    student.enroll(this);
  }
};

Course.prototype.conflictsWith = function (otherCourse) {
  let daysOverlap = false;
  this.days.forEach(function (day) {
    otherCourse.days.forEach(function (otherDay) {
      if (day === otherDay) {
        daysOverlap = true;
      }
    });
  });

  if (daysOverlap) {
    return this.timeBlock === otherCourse.timeBlock;
  } else {
    return false;
  }
};

let s1 = new Student("Andy", "Booth");
let s2 = new Student("Nick", "Cannon");

let c1 = new Course('Poker 101', 'Casino Games', 10, 6, ['mon', 'wed', 'fri']);
let c2 = new Course('Poker 102', 'Casino Games', 10, 5, ['tue', 'thu']);
let c3 = new Course('Giraffe Petting 340', 'Animals', 4, 6, ['mon']);

c1.addStudent(s1);
c3.addStudent(s1);

console.log(s1);


// c1.addStudent(s1);
// c1.addStudent(s1); // Avoids duplicate addition
// c2.addStudent(s1);
// console.log(s1.hasConflict(c3));
// c3.addStudent(s1);
// c3.addStudent(s2);
//
// console.log(c1);
// console.log(c2);
// console.log(c3);
