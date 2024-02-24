/*
  Name: Gabinete, Keith Ginoel S.
  Student No.: 2020-03670
  Lab Section: CMSC 23 - UV 5L

  Laboratory Exercise #01 : Dart Syntax
  Date created: February 24, 2024

  Program Description:
    This is a simple prototype system designed to assist commuters with 
  inquiries regarding fare details, routes, and other relevant information 
  within a transport terminal. 
 */


// import statement(s)
import '../vehicles/vehicles.dart';


// ==========================================================================================
// a parent class
abstract class Commuter {
  // ****************************************************************************************
  // class attribute(s)/attribute(s)
  static int numberOfCommuters = 0;

  // field(s)/attribute(s)
  String _type;
  int _number;
  String _commuterID;
  int _walletBalance;
  List _travelLog = [];

  // ****************************************************************************************
  // constructor (only for descendats—since abstract classes can't be initialized)
  Commuter(this._walletBalance, this._type, this._number, this._commuterID) {
    this._commuterID = "${this._type}${this._number}";
    Commuter.numberOfCommuters++;
  }

  // ****************************************************************************************
  // method(s)
  /*
    Applies the appropriate logic when a passenger attempts to board a specific type of vehicle.
   */
  void ride(String destination, Vehicle vehicle)  {
    int fareAmount = 0;

    // calculate the right fare amount
    if (this._type==Regular.TYPE) {
      fareAmount = vehicle.fares[destination] ?? 0;
    } else if (this._type == SeniorPwd.TYPE) {
      fareAmount = ((vehicle.fares[destination] ?? 0)*0.8).toInt();
    }

    // check if the vehicle is already full
    if (vehicle.passengers.length == vehicle.capacity) {
      print("Sorry, the vehicle ${vehicle.vehicleID} is already full");
    } else { // if vehicle is not full
      // check if the passenger still has enough money to afford a vehicle fare
      if (fareAmount <= this.walletBalance) {
        print("Passenger ${this.commuterID} successfully boarded ${vehicle.vehicleID} with a fare of P${fareAmount}.0");
        
        // updating important variables
        this.walletBalance -= fareAmount;
        this.travelLog.add([vehicle.vehicleID, destination]);
        vehicle.passengers.add(this);
      } else {
        print("Passenger ${this.commuterID} does not have enough fare to ride ${vehicle.vehicleID}!");
      }
    }
  }

  // ****************************************************************************************
  // getter(s) and setter(s)
  String get commuterID => _commuterID;
  int get walletBalance => _walletBalance;
  List get travelLog => _travelLog;

  set walletBalance(int value) {
    this._walletBalance = value;
  }

  set travelLog(List value) {
    this._travelLog = value;
  }
}


// ==========================================================================================
// Regular (commuter) entity
class Regular extends Commuter {
  // ****************************************************************************************
  // field(s) / attribute(s)
  static int numOfRegulars = 0;
  static const String TYPE = "REG";

  // ****************************************************************************************
  // constructor
  Regular(int walletBalance) : super (walletBalance, Regular.TYPE, Regular.numOfRegulars++, "");
}


// ==========================================================================================
// Senior citizens or persons with disabilities (commuter) entity
class SeniorPwd extends Commuter {
  // ****************************************************************************************
  // field(s) / attribute(s)
  static int numOfSeniorPwds = 0;
  static const String TYPE = "SENPWD";

  // ****************************************************************************************
  // constructor
  SeniorPwd(int walletBalance) : super (walletBalance, SeniorPwd.TYPE, SeniorPwd.numOfSeniorPwds++, "");
}
