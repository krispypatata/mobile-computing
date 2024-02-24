/*
  Name: Gabinete, Keith Ginoel S.
  Student No.: 2020-03670
  Lab Section: CMSC 23 - UV 5L

  Laboratory Exercise #02 : OOP in Dart
  Date created: February 24, 2024

  Program Description:
    This is a simple prototype system designed to assist commuters with 
  inquiries regarding fare details, routes, and other relevant information 
  within a transport terminal. 
 */


// import statement(s)
import '../commuters/commuters.dart';


// ==========================================================================================
// a parent class
abstract class Vehicle {
  // ****************************************************************************************
  // class field/attribute
  static int numberOfVehicles = 0;

  // field(s)/attribute(s)
  String _type;
  int _number;
  int _capacity;
  String _vehicleID;

  // other class instances as attributes
  List<Commuter> _passengers = [];

  // destination constants
  static const String TAFT = "Taft";
  static const String MAGALLANES = "Magallanes";
  static const String AYALA = "Ayala";
  static const String BUENDIA = "Buendia";
  static const String GUADALUPE = "Guadalupe";

  // dictionary/map for the vehicles' destinations and their fare amont
  final Map<String, int> fares = {
    Vehicle.TAFT: 0,
    Vehicle.MAGALLANES: 0,
    Vehicle.AYALA: 0,
    Vehicle.BUENDIA: 0,
    Vehicle.GUADALUPE: 0,
  };

  // ****************************************************************************************
  // constructor (only for descendats—since abstract classes can't be initialized)
  Vehicle (this._capacity, this._type, this._number, this._vehicleID) {
    this._vehicleID = "${this._type}${this._number}";
    Vehicle.numberOfVehicles++;
  }

  // ****************************************************************************************
  // method(s)
  /*
    Prints information about the current passengers of a given vehicle.
   */
  void printPassengers() {
    print("[${this._vehicleID}] - Max Capacity: ${this._capacity}");

    // traversing through the list of commuters
    for (Commuter passenger in this._passengers) {
      String printStatement = "";
      printStatement += "[${passenger.commuterID}] Wallet balance: ${passenger.walletBalance}.0 | Travel Log: [";
      
      // printing each log in the passenger's travel log
      int index = 0;
      for (List log in passenger.travelLog) {
        printStatement += "${log[0]} - ${log[1]}";

        if (index != passenger.travelLog.length-1) {
          printStatement += ", ";
        }

        index += 1;
      }
      printStatement += "]";

      // printing the log
      print(printStatement);
    }

    print("============="); 
  }

   /*
    Prints information about the fare amount in each given destination.
   */
  void printFareMatrix() {
    print("***** ${this._type} Fare Matrix *****");

    // traversing through the contents of the map
    for (var entry in this.fares.entries) {
      var key = entry.key;
      var value = entry.value;
      print("\t${key}: P${value}.0");
    }

    print("***************************\n");
  }

  // ****************************************************************************************
  // getter(s)
  String get vehicleID => _vehicleID;
  int get capacity => _capacity;
  List<Commuter> get passengers => _passengers;
}


// ==========================================================================================
// Bus entity
class Bus extends Vehicle {
  // ****************************************************************************************
  // field(s) / attribute(s)
  static int numOfBuses = 0;
  static const String TYPE = "BUS";

  // ****************************************************************************************
  // constructor
  Bus(int capacity) : super(capacity, Bus.TYPE, Bus.numOfBuses++, "") {
    // assigning appropriate fare values
    this.fares[Vehicle.TAFT] = 20;
    this.fares[Vehicle.MAGALLANES] = 30;
    this.fares[Vehicle.AYALA] = 40;
    this.fares[Vehicle.BUENDIA] = 50;
    this.fares[Vehicle.GUADALUPE] = 60;
  }
}


// ==========================================================================================
// taxi entity
class Taxi extends Vehicle {
  // ****************************************************************************************
  // field(s) / attribute(s)
  static int numOfTaxis = 0;

  // constant(s)
  static const String TYPE = "TAXI";

  // ****************************************************************************************
  // constructor
  Taxi(int capacity) : super(capacity, Taxi.TYPE, Taxi.numOfTaxis++, "") {
    // assigning appropriate fare values
    this.fares[Vehicle.TAFT] = 70;
    this.fares[Vehicle.MAGALLANES] = 80;
    this.fares[Vehicle.AYALA] = 90;
    this.fares[Vehicle.BUENDIA] = 100;
    this.fares[Vehicle.GUADALUPE] = 110;
  }
}
