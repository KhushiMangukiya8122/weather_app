import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../contoller/provider/connectivty_provider.dart';
import '../../contoller/provider/weather_provider.dart';
import '../../models/weather_model.dart';
import '../../utils/helpers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textController = TextEditingController();

  WeatherModel? weatherModel;

  late Future<WeatherModel?> weatherdata;

  @override
  void initState() {
    super.initState();
    weatherdata = APIHelper.apiHelper.fetchweather(locationame: "Surat");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: (Provider.of<ConnectivityProvider>(context)
                  .connectitvityModel
                  .connectivitystatus ==
              "Waiting..")
          ? const Center(
              child: Text("No Data Connection"),
            )
          : FutureBuilder(
              future: Provider.of<WeatherProvider>(context, listen: false)
                  .Weatherdata(locationame: "Surat"),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("ERROR : ${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  WeatherModel? weatherdata = snapshot.data;
                  return (weatherdata == null)
                      ? const Center(
                          child: Text("No Data avilable"),
                        )
                      : Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://thumbs.gfycat.com/TerrificLightheartedGermanspaniel-size_restricted.gif"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${weatherdata.name}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${weatherdata.region}",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              ", ${weatherdata.country}",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pushNamed('manage_cities_page');
                                          },
                                          icon: Icon(
                                            CupertinoIcons.building_2_fill,
                                            color: Colors.white,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pushNamed('setting_page');
                                          },
                                          icon: Icon(
                                            Icons.more_vert,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Expanded(
                                  flex: 8,
                                  child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 200,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "${weatherdata.temp_c}",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 80,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "◦c",
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  "Mostly ${weatherdata.text}",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "${weatherdata.localtime}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              ...weatherdata.hour
                                                  .map(
                                                    (e) => Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            e['time']
                                                                .toString()
                                                                .split(" ")[1],
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                            ),
                                                          ),
                                                          Text(
                                                            e['temp_c']
                                                                .toString(),
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.white,
                                                                fontSize: 25),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Divider(
                                          color: Colors.white,
                                          height: 3,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Weather Details",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 25),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Divider(
                                          color: Colors.white,
                                          height: 3,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "Apparent Temperature",
                                                  style: TextStyle(
                                                    color: Colors.white60,
                                                  ),
                                                ),
                                                Text(
                                                  "${weatherdata.feelslike_c} ◦c"
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.white,),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 100,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Humidity",
                                                  style: TextStyle(
                                                    color: Colors.white60,
                                                  ),
                                                ),
                                                Text(
                                                  "${weatherdata.humidity} %"
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.white,),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "SW Wind",
                                                  style: TextStyle(
                                                    color: Colors.white60,
                                                  ),
                                                ),
                                                Text(
                                                  " ${weatherdata.wind_kph} km/h"
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.white,),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 120,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "UV",
                                                  style: TextStyle(
                                                    color: Colors.white60,
                                                  ),
                                                ),
                                                Text(
                                                  "${weatherdata.uv}"
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.white,),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Visibility",
                                                  style: TextStyle(
                                                    color: Colors.white60,
                                                  ),
                                                ),
                                                Text(
                                                  "${weatherdata.vis_km} km"
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.white,),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 70,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Air Pressure",
                                                  style: TextStyle(
                                                    color: Colors.white60,
                                                  ),
                                                ),
                                                Text(
                                                  "${weatherdata.pressure_mb} hPa"
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.white,),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
    );
  }
}



////////country name1
// Text(
// "Country Name1 : ${weatherdata.tz_id}",
// style: const TextStyle(
// fontSize: 24,
// fontWeight: FontWeight.bold,
// ),
// ),

//////hour wise temp
// Text(
// "${weatherdata.time0}",
// style: TextStyle(
// fontSize: 20,
// color: Colors.white,
// ),
// ),
// Text(
// "${weatherdata.temp0}",
// style: TextStyle(
// fontSize: 20,
// color: Colors.white,
// ),
// )

//////time
// Text(
// "${weatherdata.hour[i]['temp_c']}",
// style: const TextStyle(
// color: Colors.white
// ),
// ),

/////// Temp F
// Text(
// "Temp F : ${weatherdata.temp_f}",
// style: const TextStyle(
// fontSize: 24,
// fontWeight: FontWeight.bold,
// ),
// ),

// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// SizedBox(
// width: 40,
// ),
// Text(
// "Weather App",
// style: TextStyle(
// fontSize: 40,
// color: Colors.white,
// ),
// ),
// IconButton(
// onPressed: () {
// Provider.of<AppThemeProvider>(context, listen: false)
//     .ChangeTheme();
// },
// icon: Icon(
// (Provider.of<AppThemeProvider>(context).appThemeModel.isDark)
// ? Icons.light_mode_outlined
//     : Icons.dark_mode,color: Colors.white,
// ),
// ),
//
// ],
// ),
