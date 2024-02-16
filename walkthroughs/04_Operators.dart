// Operators

/*
  Since Dart is a true OOP Language, the operators are actually methods defined in classes
  having a special syntax. So if, for example, you are doing a comparison x == y, it is
  just invoking the x.==(y) method to compare x and y.
 */

// Here are some of the operators that you are familiar with:

main() {
  var a, b, c;
  a = 2;
  b = 3;
  
  print("A: ${a}\nB: ${b}");

  // ===========================================================================================
  print("\nARITHMETIC");
  // '+' = Addition
  print("Addition");
  print(a+b);

  // '-' = Subtraction
  print("\nSubtraction");
  print(a-b);

  // '*' = Multiplication
  print("\nMultiplication");
  print(a*b);

  // '/' = Division
  // result will be of type double
  print("\nDivision");
  print(a/b);

  // '~/' = Integer Division
  // result will be of type int
  print("\nInteger Division");
  print(a~/b);

  // '%' = Module
  print("\nModule");
  print(a%b);

  // '-expression' = Negation
  // reverses the sign of an expression
  print("\nNegation by '-'");
  print(-a);

  // ===========================================================================================
  print("\nINCREMENT AND DECREMENT");
  print("These are Mutable");
  // '++' = increment (by 1 - default)
  print("Increment");
  print("Before: ${a++}");
  print("After: ${a--}");

  // '--' = decrement (by 1 - default)
  print("\nDecrement");
  print("Before: ${a--}");
  print("After: ${a++}");

  // ===========================================================================================
  print("EQUALITY AND RELATIONAL");
  // '!=' = Not Equal
  print("Not Equal");
  print(a!=b);

  // '>' = Greater than
  print("\nGreater than");
  print(a>b);

  // '<' = Less than
  print("\nLess than");
  print(a<b);

  // '>=' = Greater than or Equal to
  print("\nGreater than or Equal to");
  print(a>=b);

  // '<=' = Less than or Equal to
  print("\nLess than or Equal to");
  print(a<=b);

  // ===========================================================================================
  print("\nTYPE CHECKING AND CASTING");

  // 'is' = Check if the operand is the tested type
  print("\n'is' = check if the operand is the tested type");
  print("a is String");
  print(a is String);

  // 'is!' = Check if the operand is not the tested type
  print("\n'is!' = check if the operand is not the tested type");
  print("a is! bool");
  print(a is! bool);

  // 'as' = Typecast from a supertype to a subtype
  print("\n'as' = typecast from a supertype to a subtype");
  print("a as num");
  print(a as num);

  // ===========================================================================================
  print("\nLOGICAL OPERATORS");

  // '!expression' = Negate the expression
  print("Negate the expression by '!'");
  print("A negation operand mas have a static type of 'bool'");
  print("!(a>b)");
  print(!(a>b));

  // '||' = Logical OR

  // && Logical &&

}