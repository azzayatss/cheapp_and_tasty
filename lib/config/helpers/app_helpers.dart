import 'package:cheapp_and_tasty/config/constants/app_constants.dart';

class AppHelpers {
  static Uri? goToLocation({
    required double currentPositionLatitude,
    required double currentPositionLongitude,
    required double locationLatitude,
    required double locationLongitude,
  }) {
    final url = Uri.tryParse(
      '${AppConstants.googleMapsUrl}$currentPositionLatitude%2C$currentPositionLongitude&destination=$locationLatitude%2C$locationLongitude',
    );

    return url;
  }
}
