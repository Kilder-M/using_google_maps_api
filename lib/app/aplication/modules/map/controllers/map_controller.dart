import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:using_google_maps_api/app/domain/entities/address_entity.dart';
import 'package:using_google_maps_api/app/domain/services/address_service.dart';
import 'package:using_google_maps_api/utils/map_initial_camera_position.dart';
import 'package:using_google_maps_api/utils/prediction_controller.dart';

class MapController extends GetxController {
  late GoogleMapController googleMapController;
  final _addressService = GetIt.I<AddressService>();
  final initialCameraPosition = MapInitialCameraPosition().cameraPosition;

  var addressEntity = AddressEntity().obs;
  var isLoading = false.obs;
  var markerList = <Marker>{}.obs;

  Future<Prediction?> getPrediction(context) async {
    return await PredictionController().getPrediction(context);
  }

  Future<PlacesDetailsResponse> getPlacesDetails(Prediction? prediction) async {
    return await PredictionController().getPlacesDetails(prediction!);
  }

  saveAddress() async {
    isLoading.value = true;
    await _addressService.save(addressEntity.value);
    isLoading.value = false;
    addressEntity.value = AddressEntity();
  }

  setNewMaker(
      {required double lng,
      required double lat,
      required PlacesDetailsResponse placesDetails}) {
    markerList.clear();
    markerList.add(
      Marker(
        markerId: const MarkerId('0'),
        position: LatLng(
          lat,
          lng,
        ),
        infoWindow: InfoWindow(
          title: placesDetails.result.name,
        ),
      ),
    );
  }
}
