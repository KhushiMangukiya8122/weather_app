import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/connectivity_model.dart';

class ConnectivityProvider extends ChangeNotifier {
  Connectivity connectivity = Connectivity();

  ConnectitvityModel connectitvityModel =
      ConnectitvityModel(connectivitystatus: "Waiting");

  void CheckInternetstatus() {
    connectitvityModel.connectivitystream = connectivity.onConnectivityChanged.listen((ConnectivityResult connectivityResult) {
      switch(connectivityResult){
        case ConnectivityResult.wifi :
          connectitvityModel.connectivitystatus = "wifi";
          notifyListeners();
          break;
        case ConnectivityResult.mobile :
          connectitvityModel.connectivitystatus = "mobile";
          notifyListeners();
          break;
        default:
          connectitvityModel.connectivitystatus = "Waiting..";
          notifyListeners();
          break;
      }
    });
  }
}
