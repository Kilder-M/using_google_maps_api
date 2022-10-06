import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/map_controller.dart';

class MapView extends GetView<MapController> {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Obx(
          () => GoogleMap(
              initialCameraPosition: controller.initialCameraPosition,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: true,
              markers: controller.markerList.value,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController googleMapcontroller) {
                controller.googleMapController = googleMapcontroller;
              }),
        ),
        ElevatedButton(
            onPressed: (() async {
              var prediction = await controller.getPrediction(context);
              if (prediction != null) {
                var placesDetails =
                    await controller.getPlacesDetails(prediction);
                final lat = placesDetails.result.geometry!.location.lat;
                final lng = placesDetails.result.geometry!.location.lng;
                controller.setNewMaker(
                  lng: lng,
                  placesDetails: placesDetails,
                  lat: lat,
                );
                controller.googleMapController.animateCamera(
                  CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14),
                );
              }
            }),
            child: Text('aperta'))
      ]),
    );
  }
}
