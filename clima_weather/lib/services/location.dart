import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  // async await - used for time consuming tasks to happen in background, doesn't freeze up the ui
  // we can only wait on methods that can return Futures
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      // if above was Future<Position> position, then
      // print(position) would execute first and print null, then it would later get value
      // await keyword is added so that next statements wait for it to finish, rather than get just the promise
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
