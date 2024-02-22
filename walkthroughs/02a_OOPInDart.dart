/*

OOP IN DART

Even though Dart is an OOP language, it is not exactly the same as other
OOP languages like Java. This section will enumerate the ways in which
OOP is impolemented in Dart.

 */

/*

OBJECTS AND CLASSES

Classes can have both instance and class (static) members

Classes do not support constructor overloading, but you can still have
multiple ways on how to instantiate a class. 

 */

/*

ABSTRACTION

Dart contains abstract classes like in Java.

Dart provides an implicit interface concept, making every class an interface.
This allows it to be implemented by other classes without extending it.

 */

/*

INHERITANCE

By declaring a class, you are automatically extending the OBJECT type implicitly.

Only single direct inheritance is allowed.

No final class unlike Java; a class can always be extended.

 */

/*

ENCAPSULATION

No access modifiers like in Java.

Encapsulation happens in the library level instead of the class level.

Has implicit setters and getters for all fields in the class.

If an identifier starts with an underscore (_), it becomes private to its library.

 */

/*

POLYMORPHISM

Polymorphism is the ability of an object to behave like another (e.g. an int type is
also a num type)

Dart allows you to override a parent a parent method.

It does not allow you to overload your methods like what you do in Java.

 */