import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:cheapp_and_tasty/features/location/enums/additional_services_chips.dart';
import 'package:cheapp_and_tasty/features/location/repositories/locations_repository.dart';
import 'package:flutter/material.dart';
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
class FilteredLocationsList extends _$FilteredLocationsList {
  @override
  List<LocationEntity> build() {
    return [];
  }

  void search(List<LocationEntity> newSearchList) {
    if (newSearchList.isNotEmpty) {
      state = [...newSearchList];
    }
    return;
  }

  void filter(
    List<bool> chipsStateList,
    List<LocationEntity> allLocationsList,
    BuildContext context,
  ) {
    final selectedChips = <String>[];
    for (var i = 0; i < chipsStateList.length; i++) {
      if (chipsStateList[i] == true) {
        selectedChips.add(AdditionalServicesChips.values[i].name);
      }
    }

    final filteredList = allLocationsList.where((element) {
      return selectedChips.every(
        (service) => element.additionalServicesChips.contains(service),
      );
    }).toList();
    if (filteredList.isNotEmpty) {
      state = [...filteredList];
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            context.tr.searchCriteriaDoesNotMeetAnyLocation,
          ),
        ),
      );
    }
  }
}
