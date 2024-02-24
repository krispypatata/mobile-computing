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

import '../vehicles/vehicles.dart';

abstract class Commuter {
  // class attribute(s)/attribute(s)
  static int numberOfCommuters = 0;

  // field(s)/attribute(s)
  
  String type;
  int number;
  String _commuterID;
  int _walletBalance;

  // constructor (only for descendats—since abstract classes can't be initialized)
  Commuter(this._walletBalance, this.type, this.number, this._commuterID) {
    this._commuterID = "${this.type}${this.number}";
    Commuter.numberOfCommuters++;
  }

  // method(s)
  void ride(String destination, Vehicle vehicle)  {
    print("Passenger ${this.commuterID} successfully boarded BUS1 with a fare of P48.0");
  }

  // getter(s) and setter(s)
  String get commuterID => _commuterID;
  int get walletBalance => _walletBalance;
}

class Regular extends Commuter {
  // field(s) / attribute(s)
  static int numOfRegulars = 0;
  static const String TYPE = "REG";

  // constructor
  Regular(int walletBalance) : super (walletBalance, Regular.TYPE, Regular.numOfRegulars++, "") {
    
  }

  // method(s)
}

class SeniorPwd extends Commuter {
  // field(s) / attribute(s)
  static int numOfSeniorPwds = 0;
  static const String TYPE = "SENPWD";

  // constructor
  SeniorPwd(int walletBalance) : super (walletBalance, SeniorPwd.TYPE, SeniorPwd.numOfSeniorPwds++, "") {
    
  }

  // method(s)
}
