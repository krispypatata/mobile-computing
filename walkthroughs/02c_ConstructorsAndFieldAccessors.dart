/*

CONSTRUCTORS

Constructors are not required to be declared in a class. Instead, Dart
has a default empty constructor. However, if you declare a constructor,
you can only instantiate that particular class using the defined constructor.
Parameters become required.

You can omit the constructor body if you will only set the field values
like this:
    Person(this.firstName, this.lastName);

Since constructor overloading is not supported in Dart, you can use
named and factory constructors.

 */

/*

FIELD ACCESSORS

By default, all fields have their individual accessors, so you don't
need to define them all the time. However, you can define your accessor
using the get and set keywords.

 */

class Person {
  // fields
  String firstName;
  String lastName;

  // constructor
  Person (this.firstName, this.lastName);

  // getters
  String get fullName => "$firstName $lastName";
  String get initials => "${firstName[0]}. ${lastName[0]}.";

  // setter
  set fullName (String fullName) {
    var parts = fullName.split(" ");
    this.firstName = parts.first;
    this.lastName = parts.last;
  }
}

main() {
  Person somePerson = Person("clark", "kent");
  print(somePerson.fullName);
  print(somePerson.initials);
  somePerson.fullName = "peter parker";
  print(somePerson.fullName);
}

/*

Here are some things you have to remember about Dart's accessors:

Although the setter looks like a function, you invoke it using the
dot operator.

You don't have to define a pair of getters and setters for each field.
Again, there is a default accessor for each field in a class.

If you do define an accessor to get/set a field, make sure that it
doesn't have the same identifier as other fields since Dart doesn't
allow that.

If you are not going to add any additional implementation in your
accessor, it would be better to just go with the Dart default.

 */