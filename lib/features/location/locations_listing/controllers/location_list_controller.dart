import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:cheapp_and_tasty/features/location/repositories/locations_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_list_controller.g.dart';

@riverpod
class LocationListController extends _$LocationListController {
  @override
  Future<List<LocationEntity>> build() {
    return ref.watch(locationRepositoryProvider).getAllLocations();
  }
}
