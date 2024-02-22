/*

Anatomy of a Dart class

Like in Java, a class can be declared using the class keyword.
The syntax is the same too, with the class identifier starting
with an uppercase letter, and the class being enclosed in curly
braces. The following are the class members

Fields
- variables used to define the data (also called attributes in Java)

Accessors
- getters and setters
- used to access the fields of the class

Constructors
- creator method (like in Java)

Methods
- behavior/actions that a class can take (same as methods in Java)

 */

class Person {
  String? firstName;
  String? lastName;
  String getFullName() => "$firstName $lastName";
}

main() {
  Person somePerson = new Person(); 
  // Person somePerson = Person(); // valid as well



  somePerson.firstName = "Clark";
  somePerson.lastName = "Kent";
  print(somePerson.getFullName());
}

/*

Given this code above, here are some things to take note of:

- Instantiating a class does not require the new keyword

 */