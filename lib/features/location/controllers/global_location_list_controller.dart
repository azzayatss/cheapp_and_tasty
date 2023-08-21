import 'package:cheapp_and_tasty/config/fake_data/fake_data_constants.dart';
import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'global_location_list_controller.g.dart';

@riverpod
class GlobalLocationsListController extends _$GlobalLocationsListController {
  @override
  List<LocationEntity> build() {
    final globalLocationsList = <LocationEntity>[
      LocationEntity(
        locationId: FakeData.locationId,
        locationName: FakeData.locationName,
        locationDescription: FakeData.locationDescription,
        locationAdress: FakeData.locationAdress,
        locationLatitude: FakeData.locationLatitude,
        locationLongitude: FakeData.locationLongitude,
        locationWorkingSchedule: FakeData.locationWorkingSchedule,
        locationReviews: FakeData.locationReviews,
        locationRate: FakeData.locationRate,
        personWhoAddedLocation: FakeData.personWhoAddedLocation,
        dateTimeWhenLocationAdded: DateTime.now(),
        locationMenuImages: <String>[
          FakeData.locationImagesExample,
          FakeData.locationImagesExample,
          FakeData.locationImagesExample,
          FakeData.locationImagesExample,
          FakeData.locationImagesExample,
          FakeData.locationImagesExample,
        ],
        locationImages: <String>[
          FakeData.locationImagesExample,
          FakeData.locationImagesExample,
          FakeData.locationImagesExample,
          FakeData.locationImagesExample,
          FakeData.locationImagesExample,
          FakeData.locationImagesExample,
        ],
        locationCoverPhoto: FakeData.locationImagesExample,
        additionalServicesChips: [],
      ),
    ];
    state = globalLocationsList;
    return globalLocationsList;
  }

  void add(LocationEntity newLocation) {
    state = [...state, newLocation];
  }
}
