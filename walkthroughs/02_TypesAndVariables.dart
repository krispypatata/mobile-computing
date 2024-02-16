// Types and variables

main() {
  var name = 'Me';
  var surname;              // valid

  final age = 20;
  final address;            // valid

  const height = 200;
  // const weight;             // invalid
                            // -> constant variables must be initialized

  address = 'P.Sherman, 42 Wallaby Way, Sydney';
  // address = 'North Pole';   // invalid
                            // -> final variable can only be set once

  print("Hello World!");
  print('I am $name with surname $surname.');
  print('I am $age years old and lives in $address.');
  print('I am ${height}cm tall.');
}
