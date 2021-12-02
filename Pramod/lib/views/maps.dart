import 'package:flutter/material.dart';
import 'package:flutter_purpose/providers/map_providers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Maps extends StatefulWidget {
  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late final GoogleMapController mapController;

  late String _mapStyle = '';

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(_mapStyle);
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MapProviders>(
      builder: (context, mapProvider, child) {
        return GoogleMap(
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          initialCameraPosition: CameraPosition(
            target: mapProvider.center,
            zoom: 14.0,
          ),
          markers: mapProvider.markers,
        );
      },
    );
  }
}
