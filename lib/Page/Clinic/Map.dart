import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EmbedMap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmbedMapState();
  }
}

class EmbedMapState extends State<EmbedMap> {
  //bug待修
  bool _isLoading = true;

  Container buildShied(context) {
    Size size = MediaQuery.of(context).size;
    if (!_isLoading) {
      return Container();
    }
    return Container(
      width: size.width,
      height: size.height * 0.3,
      color: Colors.black.withOpacity(0.8), // Semi-transparent black
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 2),
          Text(
            'Map is loading...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    // Simulate a delay of 3 seconds to mimic loading process
    Timer(Duration(milliseconds: 2600), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(2.8327037060590463, 101.70700718313617),
      zoom: 14.4746,
    );
    final Completer<GoogleMapController> _controller =
        Completer<GoogleMapController>();

    const CameraPosition _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(2.8327037060590463, 101.70700718313617),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    Future<void> _goToTheLake() async {
      // final GoogleMapController controller = await _controller.future;
      // await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));//google tutorial看起来没用
      Fluttertoast.showToast(
          msg: "New Feature Coming Soon in Assg 2!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.3,
          child: Stack(
            children: [
              GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
              Positioned(
                top: 10.0,
                right: 10.0,
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.purple,
                  onPressed: _goToTheLake,
                  label: const Text(
                    'Locate',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  icon: const Icon(
                    Icons.location_city_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        buildShied(context),
      ],
    );
  }
}
