// Built-in Types

/*
  Dart applies TYPE INTERFACE, which means that when a variable is declared, the
  Dart analyzer infers the type based on the value or the object's constructor.
 */

/*
  Numbers
    Both of these extends the num type:
    Int: 64-bit signed non-fractional integer
    Double: 64-bit double precision floating-point number
 */

/*
  BigInt
    BigInt represents arbitrary precision integers, so the size limit is your computer's RAM.
    It's a very big number, but you shouldn't use it like int since it doesn't have the same
    performance.
 */

/*
  Booleans
    true or false
 */

/*
  Collections

  1. Lists
    - are similar to arrays in other programming languages
    - heterogenous by default

    - [index] 
      = to access elements
    - '+'
      = to concatenate
    
    - add()
      = to grow the list
      = appending the element at the end

    - instantiating a growing list is unlike Python; no need to instantiate a List object


  2. Maps
    - dynamic collection composed of a KEY-VALUE pair
    - both key and value can have any type
    - if a type is not specified, Dart will infer it as Map<dynamic, dynamic>
 */

/*
  Strings
    Strings are sequence of UTF-16 code characters used to represent text.
    You can use either single or double quotes for single lines.
    Unlike some programming languages you know, strings in Dark can be multiline by using triple quotes.
 */

main() {
  print("MAIN 1\n");

  var address = '''
    P. Sherman,
    42 Wallaby Way,
    Sydney''';

  print(address);

  main2();
}

/*
  Strings continuation:
    Like lists, you can use
    - '+'
      = to concatenate strings
    
    - [index]
      = to access a character at a specific location

    - '*'
      = repeat a string multiple times
*/

/*
  In Dart, string interpolation works somehow differently from the languages you are familiar with.
  If you are not familiar with string interpolation, it is injecting some variables, function calls,
  and expressions into a string. We use this syntax in Dart:${ }.
*/

main2() {
  print("\nMAIN 2\n");
  String intro = "I am Moana";
  print("The string value is: $intro");

  print("The length of the string is: ${intro.length}");
}

/*
  As you can see, if you only want to inject a variable instead of an expression,
  you can omit the curly brace entirely.
*/

/*
  Literals are practically the same with all other programming languages.
  It is a notation to represent a fixed value, it can be of type int, double, bool, String,
  List, Map, etc.
 */

