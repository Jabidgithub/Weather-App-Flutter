import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/getLocation.dart';
import 'package:weather_app/weatherData.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat('EEEE, d MMM, yyyy').format(dayInfo);

class MyHomePage extends StatelessWidget {
  // const MyHomePage({super.key});

  var client = WeatherData();
  var data;

  info() async {
    var position = await GetPosition();

    data = await client.getData(position.latitude, position.longitude);

    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: FutureBuilder(
          future: info(),
          builder: ((context, snapshot) {
            return Container(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.7,
                    width: size.width,
                    padding: EdgeInsets.only(top: 30),
                    margin: EdgeInsets.only(right: 10, left: 10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(
                          colors: [
                            Color(0xff955cd1),
                            Color(0xff3fa2fa),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.2, 0.85]),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "${data?.cityName}",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontFamily: 'MavenPro',
                            fontSize: 35,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          dateFormat,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontFamily: 'MavenPro',
                            fontSize: 15,
                          ),
                        ),
                        // Image.asset(
                        //   'assets/imgs/sunny.png',
                        //   width: size.width * 0.4,
                        // ),
                        Image.network(
                          'https:${data?.icon}',
                          width: size.width * 0.36,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          '${data?.condition}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Hubballi',
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${data?.temp}°',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 75,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Hubballi',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/imgs/storm.png',
                                    width: size.width * 0.15,
                                  ),
                                  Text(
                                    '${data?.wind} km/h',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Hubballi',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'wind',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontFamily: 'MavenPro',
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/imgs/humidity.png',
                                    width: size.width * 0.15,
                                  ),
                                  Text(
                                    '${data?.humidity}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Hubballi',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'humidity',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontFamily: 'MavenPro',
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/imgs/wind.png',
                                    width: size.width * 0.15,
                                  ),
                                  Text(
                                    '${data?.wind_dir}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Hubballi',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'wind direction',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontFamily: 'MavenPro',
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Gust',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontFamily: 'MavenPro',
                                  fontSize: 17),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data?.gust} kp/h',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Hubballi',
                                  fontSize: 23),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Pressure',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontFamily: 'MavenPro',
                                  fontSize: 17),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '1025.0 hpa',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Hubballi',
                                  fontSize: 23),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'UV',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontFamily: 'MavenPro',
                                  fontSize: 17),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data?.uv}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Hubballi',
                                  fontSize: 23),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Preciptation',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontFamily: 'MavenPro',
                                  fontSize: 17),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data?.pricipe}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Hubballi',
                                  fontSize: 23),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Wind',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontFamily: 'MavenPro',
                                  fontSize: 17),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data?.wind} km/h',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Hubballi',
                                  fontSize: 23),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Last Update',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontFamily: 'MavenPro',
                                  fontSize: 17),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data?.lastUpdate}',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'MavenPro',
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          })),
    );
  }
}
