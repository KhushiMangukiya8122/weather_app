import 'dart:async';

class ConnectitvityModel {
  String connectivitystatus;
  StreamSubscription? connectivitystream;

  ConnectitvityModel({
    required this.connectivitystatus,
    this.connectivitystream,
  });
}
