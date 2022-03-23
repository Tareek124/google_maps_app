import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

int? id; //this is id for every location
double? lat;
double? long;
String? mapType; //this will define the map type to view

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Google Maps",
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  myButton({
    //this function will be for the buttons for every location user picks
    Color? backgroundColor, //background for the button
    String? regionName, //name of the location
    int? regionId, //the id for the location
  }) {
    return SizedBox(
      width: 150,
      height: 55,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(backgroundColor!),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ))),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GoogleMapsClass()));
            id = regionId;
            switch (id) {
              case 1:
                //القاهرة
                lat = 30.0444;
                long = 31.2357;
                break;
              case 2:
                //الاسكندريه
                lat = 31.205753;
                long = 29.924526;
                break;
              case 3:
                //الغربيه
                lat = 30.875356;
                long = 31.03351;
                break;
              case 4:
                //كفرالشيخ
                lat = 31.10632;
                long = 30.941975;
                break;
              case 5:
                //الشرقيه
                lat = 30.732662;
                long = 31.719546;
                break;
              case 6:
                //الأقصر
                lat = 25.687243;
                long = 32.639637;
                break;
              case 7:
                //أسوان
                lat = 24.088938;
                long = 32.899830;
                break;
              case 8:
                //بني سويف
                lat = 29.07632100;
                long = 31.09693000;
                break;
            }
          },
          child: Text(
            regionName!,
            style: const TextStyle(fontSize: 19),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
            child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Center(
              child: Text(
                "محافظات مصر",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff251745),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 65,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                "اختر نوع الخريطة",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Radio(
                    value: "satellite",
                    groupValue: mapType,
                    onChanged: (value) {
                      setState(() {
                        mapType = value as String?;
                      });
                    }),
                const Text("satellite"),
                Radio(
                    value: "normal",
                    groupValue: mapType,
                    onChanged: (value) {
                      setState(() {
                        mapType = value as String?;
                      });
                    }),
                const Text("normal"),
                Radio(
                    value: "hybrid",
                    groupValue: mapType,
                    onChanged: (value) {
                      setState(() {
                        mapType = value as String?;
                      });
                    }),
                const Text("hybrid"),
                Radio(
                    value: "terrain",
                    groupValue: mapType,
                    onChanged: (value) {
                      setState(() {
                        mapType = value as String?;
                      });
                    }),
                const Text("terrain"),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20, bottom: 15),
              child: Text(
                "اختر المحافظة",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                myButton(
                  backgroundColor: Color(0xff4f0b80),
                  regionName: "القاهرة",
                  regionId: 1,
                ),
                myButton(
                    backgroundColor: Color(0xff4f0b80),
                    regionId: 2,
                    regionName: "الاسكندرية"),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                myButton(
                    regionId: 3,
                    backgroundColor: const Color(0xff4f0b80),
                    regionName: "الغربية"),
                myButton(
                    regionId: 4,
                    backgroundColor: const Color(0xff4f0b80),
                    regionName: "كفرالشيخ"),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                myButton(
                    regionId: 5,
                    backgroundColor: const Color(0xff4f0b80),
                    regionName: "الشرقية"),
                myButton(
                    regionId: 6,
                    backgroundColor: const Color(0xff4f0b80),
                    regionName: "الأقصر"),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                myButton(
                    regionId: 7,
                    backgroundColor: const Color(0xff4f0b80),
                    regionName: "أسوان"),
                myButton(
                    regionId: 8,
                    backgroundColor: const Color(0xff4f0b80),
                    regionName: "بني سويف"),
              ],
            ),
          ],
        )),
      ),
    );
  }
}

class GoogleMapsClass extends StatefulWidget {
  const GoogleMapsClass({Key? key}) : super(key: key);

  @override
  State<GoogleMapsClass> createState() => _GoogleMapsClassState();
}

class _GoogleMapsClassState extends State<GoogleMapsClass> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  myMapType() {
    switch (mapType) {
      case "satellite":
        return MapType.satellite;
        break;
      case "normal":
        return MapType.normal;
        break;
      case "hybrid":
        return MapType.hybrid;
        break;
      case "terrain":
        return MapType.terrain;
        break;
      default:
        return MapType.none;
    }
  }

  // ignore: prefer_const_constructors
  // ignore: prefer_final_fields
  CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(lat!, long!),
    zoom: 12,
  );

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: myMapType(),
        initialCameraPosition: _cameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          setState(() {});
        },
      ),
    );
  }
}
