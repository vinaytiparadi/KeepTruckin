import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:keeptruckin/constants.dart';


class LiveLocationScreen extends StatefulWidget {
  const LiveLocationScreen({Key? key}) : super(key: key);

  @override
  State<LiveLocationScreen> createState() => _LiveLocationScreenState();
}

class _LiveLocationScreenState extends State<LiveLocationScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex =
  CameraPosition(target: LatLng(18.473125, 73.823713), zoom: 16);

  List<Marker> _markers = [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(18.47349160429912, 73.82052102220638),
        infoWindow: InfoWindow(title: 'From: Auto Parts Suppliers')),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(18.474034, 73.824667),
        infoWindow: InfoWindow(title: 'To: Auto Manucturer'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Live Order Tracking"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                    bottomLeft: Radius.circular(35),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    // heightFactor: 0.3,
                    // heightFactor: 1,
                    // widthFactor: 2.5,
                    child: GoogleMap(
                      markers: Set<Marker>.of(_markers),
                      initialCameraPosition: _kGooglePlex,
                      mapType: MapType.normal,
                      // compassEnabled: false,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
                height: 55,
                width: MediaQuery.of(context).size.width * 0.9,
                child: FilledButton(
                    onPressed: () {

                    }, child: Text("View Live Location"))),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: boxDecoration(
                      color: Colors.orangeAccent.withOpacity(0.2),
                      borderradius: 40),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Statistics',
                          style: TextStyle(
                              color: Colors.orangeAccent.withAlpha(200),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 35,
                        ),

                        Container(
                            decoration: boxDecoration(
                                borderradius: 50, color: Colors.white54),
                            child: ReusableRow(
                              title: 'Vehicle No:',
                              value: 'MH12BD1498',
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                            decoration: boxDecoration(
                                borderradius: 50, color: Colors.white54),
                            child: ReusableRow(
                              title: 'Vehicle Health:',
                              value: '74%',
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                            decoration: boxDecoration(
                                borderradius: 50, color: Colors.white54),
                            child: ReusableRow(
                              title: 'Time to Deliver:',
                              value: '3h 20m',
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                            decoration: boxDecoration(
                                borderradius: 50, color: Colors.white54),
                            child: ReusableRow(
                              title: 'Fuel Left:',
                              value: '69%',
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                            decoration: boxDecoration(
                                borderradius: 50, color: Colors.white54),
                            child: ReusableRow(
                              title: 'Average Speed:',
                              value: '80 kmph',
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            )
            // SizedBox(height: 20.0)
          ],
        ));
  }
}
