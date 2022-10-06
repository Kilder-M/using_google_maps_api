import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:using_google_maps_api/app/aplication/modules/map/widgets/bottom_container.dart';
import 'package:using_google_maps_api/app/domain/entities/address_entity.dart';
import 'package:using_google_maps_api/app/widgets/map_back_button.dart';
import 'package:using_google_maps_api/app/widgets/sucess_alert.dart';
import 'package:using_google_maps_api/app/widgets/text_field.dart';
import '../controllers/map_controller.dart';

class MapView extends GetView<MapController> {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Obx(
                  () => googleMap(),
                ),
                rowTextField(context: context, onTap: Get.back),
              ],
            ),
            bottomContainer(context)
          ],
        ),
      ),
    );
  }

  GoogleMap googleMap() {
    return GoogleMap(
        initialCameraPosition: controller.initialCameraPosition,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: true,
        markers: controller.markerList.value,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController googleMapcontroller) {
          controller.googleMapController = googleMapcontroller;
        });
  }

  Widget rowTextField({
    required BuildContext context,
    final void Function()? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 55, 8, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MapBackButton(onTap: onTap),
          Expanded(
            child: SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFieldWidget(
                  hintText: 'Pesquisar',
                  onTap: () async {
                    var prediction = await controller.getPrediction(context);
                    if (prediction != null) {
                      var placesDetails =
                          await controller.getPlacesDetails(prediction);
                      final lat = placesDetails.result.geometry!.location.lat;
                      final lng = placesDetails.result.geometry!.location.lng;
                      controller.addressEntity.value = AddressEntity(
                          address: placesDetails.result.formattedAddress);
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
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomContainer(BuildContext context) {
    return BottomContainer(
      isLoading: controller.isLoading.value,
      isVisible: controller.addressEntity.value.address == null ? false : true,
      onTap: () async {
        await controller.saveAddress();
        showDialog(
          context: context,
          builder: ((context) {
            Timer(const Duration(milliseconds: 1300), () => Get.back());
            return const SucessAlert(
              title: 'Endereço salvo com Sucesso !',
            );
          }),
        );
      },
    );
  }
}
