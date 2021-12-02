import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProviders with ChangeNotifier {
  Set<Marker> _markers = Set();

  final LatLng _center = const LatLng(12.9610, 77.6387);

  Set<Marker> get markers => _markers;
  LatLng get center => _center;

  MapProviders() {
    _markers.addAll([
      Marker(
          markerId: MarkerId('domlur1'),
          position: LatLng(12.962938, 77.632852)),
      Marker(
          markerId: MarkerId('domlur2'),
          position: LatLng(12.968165, 77.631801)),
      Marker(
          markerId: MarkerId('domlur3'),
          position: LatLng(12.964897, 77.633897)),
      Marker(
          markerId: MarkerId('domlur4'),
          position: LatLng(12.966897, 77.633897)),
    ]);
  }
}
