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


// Imports
import 'vehicles/vehicles.dart';
import 'commuters/commuters.dart';

main() {
  // Instantiate two buses with differing capacities
  Bus bus0 = Bus(3);
  Bus bus1 = Bus(5);

  // Instantiate 2 taxis with differing capacities
  Taxi taxi0 = Taxi(1);
  Taxi taxi1 = Taxi(2);

  // Instantiate 5 'regular' passengers with different wallets
  Regular regular0 = Regular(500);
  Regular regular1 = Regular(400);
  Regular regular2 = Regular(100);
  Regular regular3 = Regular(20);
  Regular regular4 = Regular(150);

  // Instantiate 5 'senior/PWD' passengers with different wallets
  SeniorPwd seniorpwd0 = SeniorPwd(1000);
  SeniorPwd seniorpwd1 = SeniorPwd(200);
  SeniorPwd seniorpwd2 = SeniorPwd(80);

  // print the fare matrix
  bus0.printFareMatrix();
  taxi0.printFareMatrix();

  // ======================

  print("\n|| RIDING BUS 0 ||");
  regular0.ride("Taft", bus0);
  regular1.ride("Magallanes", bus0);
  regular2.ride("Guadalupe", bus0);
  seniorpwd0.ride("Taft", bus0);

  print("\nBus 0 Passengers:");
  bus0.printPassengers();

  // ======================

  print("\n|| RIDING BUS 1 ||");
  regular3.ride("Buendia", bus1);
  regular4.ride("Ayala", bus1);
  regular0.ride("Ayala", bus1);
  regular1.ride("Ayala", bus1);
  seniorpwd1.ride("Guadalupe", bus1);
  seniorpwd2.ride("Ayala", bus1);

  print("\nBus 1 Passengers: ");
  bus1.printPassengers();

  // ======================

  print("\n|| RIDING TAXI 0 ||");
  seniorpwd0.ride("Guadalupe", taxi0);
  seniorpwd1.ride("Ayala", taxi0);

  print("\nTaxi 0 Passengers");
  taxi0.printPassengers();

  // ======================

  print("\n|| RIDING TAXI 1 ||");
  seniorpwd2.ride("Guadalupe", taxi1);
  seniorpwd0.ride("Ayala", taxi1);
  regular2.ride("Taft", taxi1);

  print("\nTaxi 1 Passengers");
  taxi1.printPassengers();

  // ======================

  // Logging
  print('''


    [ LOG ]
    Number of Vehicles: ${Vehicle.numberOfVehicles}
    Number of Buses: ${Bus.numOfBuses}
    Number of Taxis: ${Taxi.numOfTaxis}
    
    Number of Passengers: ${Commuter.numberOfCommuters}
    Number of Regular Passengers: ${Regular.numOfRegulars}
    Number of Senior/PWD Passengers: ${SeniorPwd.numOfSeniorPwds}
''');
}
