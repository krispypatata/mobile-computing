void main() {
  String greet = greeting();
  int age = getAge();
  String goodbyeMessage = goodbye();

  print(greet);
  print(age);
  print(goodbyeMessage);
}

String greeting() {
  return 'Hello';
}

int getAge() {
  return 22;
}

// arrow function
String goodbye() => 'Goodbye!';
