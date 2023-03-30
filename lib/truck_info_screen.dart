import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TruckInfoScreen extends StatefulWidget {
  const TruckInfoScreen({Key? key}) : super(key: key);

  @override
  State<TruckInfoScreen> createState() => _TruckInfoScreenState();
}

class _TruckInfoScreenState extends State<TruckInfoScreen> {

  BitmapDescriptor t1 = BitmapDescriptor.defaultMarker;
  BitmapDescriptor t2 = BitmapDescriptor.defaultMarker;
  BitmapDescriptor t3 = BitmapDescriptor.defaultMarker;
  BitmapDescriptor t4 = BitmapDescriptor.defaultMarker;
  BitmapDescriptor t5 = BitmapDescriptor.defaultMarker;
  BitmapDescriptor t6 = BitmapDescriptor.defaultMarker;
  BitmapDescriptor t7 = BitmapDescriptor.defaultMarker;
  BitmapDescriptor t8 = BitmapDescriptor.defaultMarker;
  BitmapDescriptor t9 = BitmapDescriptor.defaultMarker;
  BitmapDescriptor t10 = BitmapDescriptor.defaultMarker;

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assets/aaa.png')
        .then((icon) {
      t1 = icon;
    });

    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assets/truck3small.png')
        .then((icon) {
      t2 = icon;
    });

    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assets/truck2small.png')
        .then((icon) {
      t3 = icon;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assets/aaa.png')
        .then((icon) {
      t4 = icon;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assets/truck2small.png')
        .then((icon) {
      t5 = icon;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assets/truck5small.png')
        .then((icon) {
      t6 = icon;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assets/truck3small.png')
        .then((icon) {
      t7 = icon;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assets/aaa.png')
        .then((icon) {
      t8 = icon;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assets/truck4small.png')
        .then((icon) {
      t9 = icon;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assets/truck5small.png')
        .then((icon) {
      t10 = icon;
    });
  }

  @override
  void initState(){
    setCustomMarkerIcon();
    super.initState();
  }

  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex =
  CameraPosition(target: LatLng(18.47653, 73.82057), zoom: 14.7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orangeAccent,
        appBar: AppBar(
          title: Text("Vehicles Location Overview"),
          centerTitle: true,
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async{
        //     GoogleMapController controller = await _controller.future;
        //     controller.animateCamera(
        //         CameraUpdate.newCameraPosition(
        //             CameraPosition(
        //                 target: LatLng(18.479, 73.82557),
        //                 zoom: 16.0
        //             )
        //         )
        //     );
        //     setState(() {
        //
        //     });
        //   },
        //   child: Icon(Icons.location_disabled_outlined),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    // heightFactor: 0.3,
                    // heightFactor: 1,
                    // widthFactor: 2.5,
                    child: GoogleMap(
                      markers: {
                        Marker(
                          icon: t1,
                            markerId: MarkerId('1'),
                            position: LatLng(18.5204, 73.8567),
                            infoWindow: InfoWindow(
                                title: 'My Location'
                            )
                        ),
                        Marker(
                            markerId: MarkerId('2'),
                            icon: t2,
                            position: LatLng(18.5269, 73.8624),
                            infoWindow: InfoWindow(
                                title: 'My 2nd Location'
                            )
                        ),
                        Marker(
                            icon: t3,
                            markerId: MarkerId('3'),
                            position: LatLng(18.5488, 73.8513),
                            infoWindow: InfoWindow(
                                title: 'My 3rd Location'
                            )
                        ),
                        Marker(
                            icon: t4,
                            markerId: MarkerId('4'),
                            position: LatLng(18.5454, 73.8256),
                            infoWindow: InfoWindow(
                                title: 'My 4th Location'
                            )
                        ),
                        Marker(
                            icon: t5,
                            markerId: MarkerId('5'),
                            position: LatLng(18.5381, 73.8300),
                            infoWindow: InfoWindow(
                                title: 'My 5th Location'
                            )
                        ),
                        Marker(
                            icon: t6,
                            markerId: MarkerId('6'),
                            position: LatLng(18.5687, 73.8370),
                            infoWindow: InfoWindow(
                                title: 'My 6th Location'
                            )
                        ),
                        Marker(
                            icon: t7,
                            markerId: MarkerId('7'),
                            position: LatLng(18.5722, 73.8612),
                            infoWindow: InfoWindow(
                                title: 'My 7th Location'
                            )
                        ),
                        Marker(
                            icon: t8,
                            markerId: MarkerId('8'),
                            position: LatLng(18.5029, 73.8403),
                            infoWindow: InfoWindow(
                                title: 'My 8th Location'
                            )
                        ),
                        Marker(
                            icon: t9,
                            markerId: MarkerId('9'),
                            position: LatLng(
                                18.4676, 73.8118),
                            infoWindow: InfoWindow(
                                title: 'My 9th Location'
                            )
                        ),
                        Marker(
                            icon: t10,
                            markerId: MarkerId('10'),
                            position: LatLng(
                                18.4494, 73.8702),
                            infoWindow: InfoWindow(
                                title: 'My 10th Location'
                            )
                        ),
                      },
                      initialCameraPosition: _kGooglePlex,
                      mapType: MapType.normal,
                      // compassEnabled: false,
                      onMapCreated: (GoogleMapController controller){
                        _controller.complete(controller);
                      },
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(height: 20.0)
          ],
        ));
  }
}
