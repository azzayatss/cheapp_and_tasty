import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:cheapp_and_tasty/features/location/repositories/locations_repository.dart';
import 'package:cheapp_and_tasty/features/locations_listing/enums/sort_options.dart';
// import 'package:cheapp_and_tasty/features/locations_listing/enums/sort_options.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_list_controller.g.dart';

@riverpod
class LocationListController extends _$LocationListController {
  @override
  Future<List<LocationEntity>> build() {
    return ref.watch(locationRepositoryProvider).getAllLocations();
  }
}

@riverpod
class SearchBarStateController extends _$SearchBarStateController {
  @override
  String build() {
    return '';
  }

  void update(String newSearchValue) {
    state = newSearchValue;
  }
}

@riverpod
class FilterChipsController extends _$FilterChipsController {
  @override
  List<String> build() {
    return [];
  }

  void update(List<String> selectedChipsList) {
    state = [...selectedChipsList];
  }
}

@riverpod
class FilteredLocationsList extends _$FilteredLocationsList {
  @override
  Future<List<LocationEntity>> build(
    String searchRequest,
    List<String> selectedChips,
  ) async {
    final locations = await ref.watch(locationListControllerProvider.future);

    return locations
        .where(
          (element) =>
              element.locationName
                  .toLowerCase()
                  .contains(searchRequest.toLowerCase()) &&
              selectedChips.every(
                (service) => element.additionalServicesChips.contains(service),
              ),
        )
        .toList();
  }
}

@riverpod
class SortedValue extends _$SortedValue {
  @override
  SortOptions build() {
    return SortOptions.unsorted;
  }

  void update(SortOptions sortBy) {
    state = sortBy;
  }
}
