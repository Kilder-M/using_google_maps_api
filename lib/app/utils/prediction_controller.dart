import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';

class PredictionController {
  Future<Prediction?> getPrediction(context) async {
    Prediction? prediction = await PlacesAutocomplete.show(
      context: context,
      apiKey: FlutterConfig.get('MAPS_API_KEY'),
      mode: Mode.overlay,
      language: 'pt',
      strictbounds: false,
      types: [''],
      components: [Component(Component.country, 'br')],
      onError: _predictionError,
      decoration: InputDecoration(
        hintText: 'Digite o CEP',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(
            width: 0.5,
            color: Colors.white,
          ),
        ),
      ),
    );
    return prediction;
  }

  Future<void> _predictionError(
      PlacesAutocompleteResponse placesAutocompleteResponse) async {
    Get.snackbar(
      'Erro ao pesquisar o local',
      placesAutocompleteResponse.errorMessage!,
      animationDuration: const Duration(seconds: 3),
    );
  }

  Future<GoogleMapsPlaces> getGoogleMapPlaces() async {
    return GoogleMapsPlaces(
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
      apiKey: FlutterConfig.get('MAPS_API_KEY'),
    );
  }

  Future<PlacesDetailsResponse> getPlacesDetails(Prediction prediction) async {
    GoogleMapsPlaces places = await getGoogleMapPlaces();
    return await places.getDetailsByPlaceId(
      prediction.placeId!,
    );
  }
}
