import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:using_google_maps_api/app/widgets/text_field.dart';
import '../controllers/map_controller.dart';

class MapView extends GetView<MapController> {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
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
              textField(context),
            ],
          ),
          bottomContainer(context, () async {})
        ],
      ),
    );
  }

  Container bottomContainer(BuildContext context, void Function() onTap) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.30,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Text(
                'Você gostaria de salvar esse endereço ?',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            saveButton(onTap)
          ],
        ),
      ),
    );
  }

  GestureDetector saveButton(void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Center(
          child: Text(
            'Salvar',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget textField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 55),
      child: TextFieldWidget(
        hintText: 'Pesquisar',
        onTap: () async {
          var prediction = await controller.getPrediction(context);
          if (prediction != null) {
            var placesDetails = await controller.getPlacesDetails(prediction);
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
        },
      ),
    );
  }
}
