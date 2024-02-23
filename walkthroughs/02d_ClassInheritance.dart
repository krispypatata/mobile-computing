/*

CLASS INHERITANCE

 */

// class definition
class Person {
  // fields (attributes)
  String firstName;
  String lastName;

  // constructor
  Person(this.firstName, this.lastName);

  // method(s)
  // getter(s) & setter(s)
  String get fullName => "${firstName} ${lastName}";
  String get initials => "${firstName[0]}. ${lastName[0]}.";

  set fullName (String fullName) {
    var parts = fullName.split(" ");
    this.firstName = parts.first;
    this.lastName = parts.last;
  } 
}

// another class definition
class Student extends Person {
  String nickname;
  Student (String firstName, String lastName, this.nickname)
  : super (firstName, lastName);

  @override
  String toString() => "${fullName}, also known as ${nickname}";
}

// start of the program
main() {
  Student student = new Student ("Clark", "Kent", "Kal-El");
  print(student);
}

/*

Like in Java, you use the super keyword to invoke the constructor
of the superclass. The student class has its own constructor, but it
passes the firstName and lastName fields fields to the Person class
via the super keyword.

 */

/*

toString() Method

In the example above, a toString() method is overriden in the Student
class. The syntax is just similar to Java. In this example, the toString()
method in Student is overriding the toString() method in the Object class.

The toString() method prints the string representation of an object in
Dart. You don't need to explicitly call the toString() method though,
it is automatically called whenever you print a class. Try commenting
out the overriden method in Student to see the default value that Dart
will print.

 */