import 'package:syncfusion_flutter_maps/maps.dart';

class TouristPlaceDetails {
  const TouristPlaceDetails(this.latLng, this.place);

  final MapLatLng latLng;
  final String place;
}