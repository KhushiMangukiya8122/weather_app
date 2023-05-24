import 'package:flutter/material.dart';

class TemperatureUnitPage extends StatefulWidget {
  const TemperatureUnitPage({Key? key}) : super(key: key);

  @override
  State<TemperatureUnitPage> createState() => _TemperatureUnitPageState();
}

class _TemperatureUnitPageState extends State<TemperatureUnitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Temperature Unit"),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("Degree Celsius"),
            subtitle: Text("Degree Celsius/◦c"),
          ),
          ListTile(
            title: Text("Degree Fahrenheit"),
            subtitle: Text("Degree Fahrenheit/◦f"),
          ),
        ],
      ),
    );
  }
}
