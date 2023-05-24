import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../contoller/provider/weather_provider.dart';

class AddCityPage extends StatefulWidget {
  const AddCityPage({Key? key}) : super(key: key);

  @override
  State<AddCityPage> createState() => _AddCityPageState();
}

class _AddCityPageState extends State<AddCityPage> {

  late String currentName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Add City"),
        centerTitle: true,
        backgroundColor: Colors.grey.shade800,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
            onSubmitted: (String name) async {
                if (name.isNotEmpty) {
                  Provider.of<WeatherProvider>(context, listen: false)
                      .locationchanage(name);
                } else {
                  Provider.of<WeatherProvider>(context, listen: false)
                      .locationchanage(
                          Provider.of<WeatherProvider>(context).location);
                }
              },
              controller:
                  Provider.of<WeatherProvider>(context).citynamecontroller,
            cursorColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade800,
                ),
                hintText: "Enter City...",
                hintStyle: TextStyle(
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "TOP CITIES",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text("Surat",style: TextStyle(fontSize: 16,color: Colors.white),),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text("New Delhi",style: TextStyle(fontSize: 16,color: Colors.white),),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text("Kolkata",style: TextStyle(fontSize: 18,color: Colors.white),),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text("Mumbai",style: TextStyle(fontSize: 18,color: Colors.white),),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text("Chennai",style: TextStyle(fontSize: 18,color: Colors.white),),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text("Lucknow",style: TextStyle(fontSize: 18,color: Colors.white),),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "TOP CITIES - WORLD",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text("New York",style: TextStyle(fontSize: 18,color: Colors.white),),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text("Paris",style: TextStyle(fontSize: 18,color: Colors.white),),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text("London",style: TextStyle(fontSize: 18,color: Colors.white),),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text("Tokyo",style: TextStyle(fontSize: 18,color: Colors.white),),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text("Rome",style: TextStyle(fontSize: 18,color: Colors.white),),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text("Dubai",style: TextStyle(fontSize: 18,color: Colors.white),),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text("Moscow",style: TextStyle(fontSize: 18,color: Colors.white),),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text("Sydney",style: TextStyle(fontSize: 18,color: Colors.white),),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text("Singapore",style: TextStyle(fontSize: 18,color: Colors.white),),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 16,
                ),
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text("Beijing",style: TextStyle(fontSize: 18,color: Colors.white),),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 30,
                  width: 100,
                  alignment: Alignment.center,
                  child: Text("Athens",style: TextStyle(fontSize: 18,color: Colors.white),),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade800,
    );
  }
}
