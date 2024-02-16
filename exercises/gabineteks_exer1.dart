/*
  Name: Gabinete, Keith Ginoel S.
  Student No.: 2020-03670
  Lab Section: CMSC 23 - UV 5L
  Laboratory Exercise #01 : Dart Syntax
  Program Description:
    Given a list of integers, print the number of occurrences of each unique number. Then, print
  another list containing the product of each unique number and its number of occurrences.
 */

// for printint without a new line
import "dart:io";

// start of the program
main() {
  // list of hardcoded inputs
  List<int> inputList = [1, 3, 1, 4, 3, 1, 5, 5, 3, 2, 5, 6, 8];
  
  /* OUTPUT CONSOLE*/
  print("Input list: ${inputList}");

  // create an empty list to hold the unique integers found in the input list
  List<int> uniqueContentsList = [];

  // loop through the contents of the inputList
  // get the unique integers in the list and store them in the empty list we created earlier
  for (int i=0; i<inputList.length; i++) {
    // check the current element
    var currentElement = inputList[i];

    // for checking
    // print(currentElement);

    // only add the current element to the newly created list if it still doesn't exist there
    if (uniqueContentsList.contains(currentElement)==false) {
      uniqueContentsList.add(currentElement);
    }
  }
 
  // for checking
  // print(uniqueContentsList);

  // create an empty map to contain the key-value pair - uniqueInteger : numberOfOccurences
  Map<int, int> frequencyMap = {};
  for (int i=0; i<uniqueContentsList.length; i++ ) {
    // counter for the number of occurences of a unique integer
    int numOccurences = 0;

    // loop through the contents of the input list and count the occurences of each unique integer
    for (int j=0; j<inputList.length; j++) {
      // match found
      if (uniqueContentsList[i]==inputList[j]) {
        // increment the counter for frequency
        numOccurences++;
      }
    }

    // add the unique integer and its number of occurences as a key-value pair item in our frequency map
    frequencyMap[uniqueContentsList[i]] = numOccurences;
  }

  // for checking
  // print(frequencyMap);

  /* OUTPUT CONSOLE*/
  print("Number of occurences:");
  // print("Input list: ${inputList}");
  frequencyMap.forEach((key, value) => print("\t${key} : ${value}")); 

  // get the product of each key-value pair in our frequency map and store them in a list
  List<int> productsList = [];

  /* OUTPUT CONSOLE*/
  frequencyMap.forEach((key, value) => productsList.add(key*value));
  stdout.write("Products: ");

  // loop through the elements of the product list and print them
  for (int i=0; i<productsList.length; i++) {
    stdout.write("${productsList[i]} ");
  }
  print("");
  
} // end of the program
