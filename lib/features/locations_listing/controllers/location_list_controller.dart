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
class FilteredLocationsList extends _$FilteredLocationsList {
  @override
  Future<List<LocationEntity>> build(String searchRequest) async {
    final locations = await ref.watch(locationListControllerProvider.future);

    return locations
        .where(
          (element) => element.locationName
              .toLowerCase()
              .contains(searchRequest.toLowerCase()),
        )
        .toList();
  }

  // void filter(
  //   List<bool> chipsStateList,
  //   List<LocationEntity> allLocationsList,
  //   BuildContext context,
  // ) {
  //   final selectedChips = <String>[];
  //   for (var i = 0; i < chipsStateList.length; i++) {
  //     if (chipsStateList[i] == true) {
  //       selectedChips.add(AdditionalServicesChips.values[i].name);
  //     }
  //   }

  //   final filteredList = allLocationsList.where((element) {
  //     return selectedChips.every(
  //       (service) => element.additionalServicesChips.contains(service),
  //     );
  //   }).toList();
  //   if (filteredList.isNotEmpty) {
  //     state = [...filteredList];
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(
  //           context.tr.searchCriteriaDoesNotMeetAnyLocation,
  //         ),
  //       ),
  //     );
  //   }
  // }
}
