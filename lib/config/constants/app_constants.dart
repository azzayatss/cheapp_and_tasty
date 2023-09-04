class AppConstants {
  static const googleMapsApiKey = 'AIzaSyCxUB2zKCIo0BZQXTRNdzEL6NRFhzBFfVM';
  static const defaultLatitude = 49.84890577036393;
  static const defaultLongitude = 24.030671653555967;
  static const mapZoomLevel = 13.5;
}

Uri? goToLocation({
  required double currentPositionLatitude,
  required double currentPositionLongitude,
  required double locationLatitude,
  required double locationLongitude,
}) {
  final url = Uri.tryParse(
    'https://www.google.com/maps/dir/?api=1&origin=$currentPositionLatitude%2C$currentPositionLongitude&destination=$locationLatitude%2C$locationLongitude',
  );

  return url;
}
