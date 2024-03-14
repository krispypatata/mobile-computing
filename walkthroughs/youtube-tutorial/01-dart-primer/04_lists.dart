void main() {
  // list of different data types
  List names = ['Hello', 'World', 22];
  names.add('Keith');
  print(names);

  names.remove('Keith');
  print(names);

  // list of objects with a single data type
  List<int> numbers = [1, 2, 3, 4];
  print(numbers);
}
