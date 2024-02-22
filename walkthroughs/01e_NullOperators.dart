// Null-safe and null-aware operators

main0() {
  // assignment of null variables
  // int a = null; // INVALID in null-safe Dart.
  int? a = null;  // VALID in null-safe Dart.
  int? b;         // VALID - the initial value of b is null.
}

main1() {
  int? a;       // = null
  a ??- 3;
  print(a);     // prints 3.

  a ??= 5;
  print(a);     // Still prints 3.
}


main2() {
  print(20 ?? 11);    // Prints 20.
  print(null ?? 22);  // Prints 22
}


