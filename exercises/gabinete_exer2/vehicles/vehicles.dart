/*
  Name: Gabinete, Keith Ginoel S.
  Student No.: 2020-03670
  Lab Section: CMSC 23 - UV 5L

  Laboratory Exercise #01 : Dart Syntax
  Date created: February 24, 2024


  Program Description:
    Given a list of integers, print the number of occurrences of each unique number. Then, print
  another list containing the product of each unique number and its number of occurrences.
 */

// parent class
import '../commuters/commuters.dart';

abstract class Vehicle {
  // class field/attribute
  static int numberOfVehicles = 0;

  // field(s)/attribute(s)
  String type;
  int number;
  int capacity;
  String vehicleID;

  // other class instances as attributes
  List<Commuter> passengers = [];

  // destination constants
  static const String TAFT = "Taft";
  static const String MAGALLANES = "Magallanes";
  static const String AYALA = "Ayala";
  static const String BUENDIA = "Buendia";
  static const String GUADALUPE = "Guadalupe";

  final Map<String, int> fares = {
    Vehicle.TAFT: 0,
    Vehicle.MAGALLANES: 0,
    Vehicle.AYALA: 0,
    Vehicle.BUENDIA: 0,
    Vehicle.GUADALUPE: 0,
  };

  // constructor (only for descendats—since abstract classes can't be initialized)
  Vehicle (this.capacity, this.type, this.number, this.vehicleID) {
    this.vehicleID = "${this.type}${this.number}";
    Vehicle.numberOfVehicles++;
  }

  // method(s)
  void printPassengers() {
    print("[${this.vehicleID}] - Max Capacity: ${this.capacity}");
  }

  void printFareMatrix() {
    print("***** ${this.type} Fare Matrix *****");

    // traversing through the contents of the map
    for (var entry in this.fares.entries) {
      var key = entry.key;
      var value = entry.value;
      print("\t${key}: P${value}.0");
    }

    print("***************************\n");
  }
}

// bus entity
class Bus extends Vehicle {
  // field(s) / attribute(s)
  static int numOfBuses = 0;
  static const String TYPE = "BUS";

  // constructor
  Bus(int capacity) : super(capacity, Bus.TYPE, Bus.numOfBuses++, "") {
    // assigning appropriate fares
    this.fares[Vehicle.TAFT] = 20;
    this.fares[Vehicle.MAGALLANES] = 30;
    this.fares[Vehicle.AYALA] = 40;
    this.fares[Vehicle.BUENDIA] = 50;
    this.fares[Vehicle.GUADALUPE] = 60;
  }

  // method(s)
}



// taxi entity
class Taxi extends Vehicle {
  // field(s) / attribute(s)
  static int numOfTaxis = 0;

  // constant(s)
  static const String TYPE = "TAXI";

  // constructor
  Taxi(int capacity) : super(capacity, Taxi.TYPE, Taxi.numOfTaxis++, "") {
    // assigning appropriate fares
    this.fares[Vehicle.TAFT] = 70;
    this.fares[Vehicle.MAGALLANES] = 80;
    this.fares[Vehicle.AYALA] = 90;
    this.fares[Vehicle.BUENDIA] = 100;
    this.fares[Vehicle.GUADALUPE] = 110;
  }

  // method(s)
}
