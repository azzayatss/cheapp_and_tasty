import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:cheapp_and_tasty/features/location/location_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_controller.g.dart';

@riverpod
class LocationListController extends _$LocationListController {
  @override
  List<LocationEntity> build() {
    return globalLocationsList;
  }

  void add(LocationEntity newLocation) {
    state = [...state, newLocation];
  }
}
