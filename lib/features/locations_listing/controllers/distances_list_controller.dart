import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'distances_list_controller.g.dart';

@riverpod
class DistancesListController extends _$DistancesListController {
  @override
  List<({double? distanceToLocation, LocationEntity location})> build() {
    return [];
  }

  void update(
    List<({double? distanceToLocation, LocationEntity location})> list,
  ) {
    state = [...list];
  }
}
