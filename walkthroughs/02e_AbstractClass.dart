/*

ABSTRACT CLASS

To define an abstract class in dart, you must include the abstract
keyword in the creation of the class.

Abstract classes are classes that cannot be instantiated. Extending
an abstract class, all abstracted methods should be implemented.

 */

// class definition
abstract class Animal {
  // fields
  String animalName;
  int numOfLegs;
  bool isHungry = true;

  // constructor
  Animal(this.animalName, this.numOfLegs);

  // method(s)
  void eat();
}

// yet another class definition
class Dog extends Animal {
  // fields / attribute(s)
  int numOfDogs = 0;

  // constructor
  Dog (String animalName) : super(animalName, 4) {
    numOfDogs ++;
  }

  // implementation of the super class method "eat"
  void eat() {
    this.isHungry = false;
    print("Dog: ${animalName} is now eating. The value of isHungry is ${isHungry}.");
  }
}

// start of the main program
main() {
  Dog spot = Dog("Spot");
  spot.eat();
}

/*

IMPORTING

To import a library in Dart, use the following syntax:

import library_path;

You can also use the keywords show and hide to control the identifiers
that you want to import in your file:

import 'person_lib.dart' show Person, Student;
import 'person_lib.dart' hide Employee;

 */