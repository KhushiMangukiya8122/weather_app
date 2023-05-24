import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('temperature_unit_page');
            },
            splashColor: Colors.grey,
            title: Text("Temperature Unit"),
            subtitle: Text("Degree Celsius/◦c"),
            trailing: Icon(Icons.navigate_next),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('about_page');
            },
            splashColor: Colors.grey,
            title: Text("About"),
            trailing: Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
