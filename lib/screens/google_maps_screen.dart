import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GoogleMapsScreen extends StatefulWidget {
  final double latitude;
  final double longitude;

  const GoogleMapsScreen(
      {super.key, required this.latitude, required this.longitude});

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  final Completer<GoogleMapsController> _controller = Completer();
  late CameraPosition _cameraPosition;
  late Set<Marker> _markers;
  late MarkerId _markerId;

  @override
  void _iniState() {
    super.initState();
    _cameraPosition = CameraPosition(
      target: LatLng(widget.latitude, widget.longitude),
      zoom: 15,
    );
    _markers = {};
    _markerId =
    MarkerId(Widget.latitude.toString() + widget.longitude.toString());
    _markers.add(
      Marker(markerId: _markerId,
      position: LatLng(widget.latitude,widget.longitude),
      infoWindow: const InfoWindow(
        title: 'Your Location',
        snippet: "your current location is here",
      ),
      ),
    )
  };

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text("google Map"),
    ),body: GoogleMap(
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: _cameraPosition,
      markers: _markers,
      onMapCreated: (GoogleMapController controller){
        _controller.complete(controller);
        Future.delayed(const Duration(milliseconds: 500),(){
          
        })
      },
    ),
    ),

  }
}