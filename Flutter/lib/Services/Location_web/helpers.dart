@JS('navigator.geolocation')
library weblocation;

import 'package:js/js.dart';

import 'loc.dart';

// Retrieves the device's current location
@JS('getCurrentPosition')
external void getCurrentPosition(Function success(GeolocationPosition pos));
