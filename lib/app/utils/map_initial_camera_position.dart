import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapInitialCameraPosition {
  static const initialLat = -14.2400732;
  static const initialng = -53.1805017;

  CameraPosition get cameraPosition => const CameraPosition(
        target: LatLng(
          initialLat,
          initialng,
        ),
        zoom: 5,
      );
}
