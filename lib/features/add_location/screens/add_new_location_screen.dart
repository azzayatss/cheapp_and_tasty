import 'dart:developer' as dev;
import 'dart:io';

import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/constants/app_constants.dart';
import 'package:cheapp_and_tasty/config/storage_pathways.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/auth/controllers/sign_in_controller.dart';
import 'package:cheapp_and_tasty/features/reviews/widgets/add_rating_widget.dart';
import 'package:cheapp_and_tasty/features/add_location/widgets/form_cancel_button.dart';
import 'package:cheapp_and_tasty/features/add_location/widgets/form_save_button.dart';
import 'package:cheapp_and_tasty/features/add_location/widgets/pick_image_button.dart';
import 'package:cheapp_and_tasty/features/add_location/widgets/picked_images_slider.dart';
import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:cheapp_and_tasty/features/location/repositories/locations_repository.dart';
import 'package:cheapp_and_tasty/features/location/widgets/additional_services_chips.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class AddNewLocationScreen extends HookConsumerWidget {
  const AddNewLocationScreen({super.key});
  static const String route = 'add-new-location';
  static const String routeName = 'addNewLocation';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final picker = ImagePicker();

    final currentUser = ref.watch(signInControllerProvider).valueOrNull;

    final formKey = useMemoized(GlobalKey<FormState>.new);

    final showEmptyCoverPhotoAlert = useState(false);
    final showEmptyMenuPhotosAlert = useState(false);
    final showEmptyLocationPhotosAlert = useState(false);
    final showEmptyAddresAlert = useState(false);

    final locationNameController = useTextEditingController();
    final locationDescriptionController = useTextEditingController();
    final locationAdressController = useTextEditingController();
    final locationScheduleController = useTextEditingController();
    final locationReviewController = useTextEditingController();
    final selectedServices = useRef(<String>[]);
    final locationRatesList = useState(<double>[]);
    final menuUrlList = useState<List<String>>([]);
    final menuPhotos = useState<List<File?>>([]);
    final locationPhotosUrlList = useState<List<String>>([]);
    final locationPhotos = useState<List<File?>>([]);
    final coverPhotoUrl = useState<String>('');
    final coverPhoto = useState<File?>(null);
    final latitude = useState<double>(0);
    final longitude = useState<double>(0);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.tr.addNewLocationTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppLayouts.defaultPadding),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(AppLayouts.defaultPadding),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.tr.coverPhotoLabel,
                        style: context.textTheme.bodyLarge,
                      ),
                      if (showEmptyCoverPhotoAlert.value == true) ...[
                        Text(
                          context.tr.emptyCoverPhotoWarning,
                          style: context.textTheme.labelSmall
                              ?.copyWith(color: Colors.red),
                        ),
                      ],
                      const SizedBox(height: AppLayouts.defaultPadding),
                      if (coverPhoto.value == null)
                        PickImageButton(
                          onPressed: () async {
                            final xPhoto = await picker.pickImage(
                              source: ImageSource.gallery,
                              requestFullMetadata: false,
                            );
                            final photo = File(xPhoto!.path);
                            coverPhoto.value = photo;
                            final storageRef = FirebaseStorage.instance
                                .ref()
                                .child(StoragePathways.coverPhotos);
                            final ref = storageRef.child(const Uuid().v4());
                            try {
                              await ref.putFile(photo);
                              final downloadUrl = await ref.getDownloadURL();
                              dev.log(downloadUrl);
                              coverPhotoUrl.value = downloadUrl;
                            } on FirebaseException catch (e) {
                              dev.log(e.message.toString());
                            }
                            if (showEmptyCoverPhotoAlert.value == true) {
                              showEmptyCoverPhotoAlert.value =
                                  !showEmptyCoverPhotoAlert.value;
                            }
                          },
                        )
                      else
                        Center(
                          child: Image.file(
                            coverPhoto.value!,
                            width: 300,
                            height: 300,
                          ),
                        ),
                      const SizedBox(height: AppLayouts.defaultPadding),
                      TextFormField(
                        controller: locationNameController,
                        decoration: InputDecoration(
                          hintText: context.tr.locationNameHint,
                          labelText: context.tr.locationNameLabel,
                        ),
                        validator: ValidationBuilder()
                            .required(context.tr.requiredField)
                            .minLength(3)
                            .build(),
                      ),
                      const SizedBox(height: AppLayouts.defaultPadding),
                      TextFormField(
                        controller: locationDescriptionController,
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: context.tr.locationDescriptionHint,
                          labelText: context.tr.locationDescriptionLabel,
                        ),
                      ),
                      const SizedBox(height: AppLayouts.defaultPadding),
                      //as option autocomplete may be redone by using classic api:
                      // https://developers.google.com/maps/documentation/places/web-service/autocomplete
                      // with possibility to provide language parameter
                      GooglePlaceAutoCompleteTextField(
                        boxDecoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: context.colorScheme.outline,
                            ),
                          ),
                        ),
                        textEditingController: locationAdressController,
                        googleAPIKey: AppConstants.googleMapsApiKey,
                        inputDecoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: context.tr.locationAdressHint,
                          labelText: context.tr.locationAdressLabel,
                          border: InputBorder.none,
                        ),
                        debounceTime: 200,
                        getPlaceDetailWithLatLng: (Prediction prediction) {
                          longitude.value =
                              double.parse(prediction.lng ?? '0.0');
                          latitude.value =
                              double.parse(prediction.lat ?? '0.0');
                          locationAdressController.text =
                              prediction.description ?? '';
                        },
                        itemClick: (Prediction prediction) {
                          locationAdressController
                            ..text = prediction.description ?? ''
                            ..selection = TextSelection.fromPosition(
                              TextPosition(
                                offset: prediction.description?.length ?? 0,
                              ),
                            );
                        },
                        seperatedBuilder: const Divider(),
                      ),
                      if (showEmptyAddresAlert.value == true &&
                          locationAdressController.text.isEmpty) ...[
                        Text(
                          context.tr.emptyAddressWarning,
                          style: context.textTheme.labelSmall?.copyWith(
                            color: Colors.red,
                          ),
                        ),
                      ],
                      const SizedBox(height: AppLayouts.defaultPadding),
                      TextFormField(
                        controller: locationScheduleController,
                        decoration: InputDecoration(
                          hintText: context.tr.locationScheduleHint,
                          labelText: context.tr.locationScheduleLabel,
                        ),
                        validator: ValidationBuilder()
                            .required(context.tr.requiredField)
                            .minLength(6)
                            .build(),
                      ),
                      const SizedBox(height: AppLayouts.defaultPadding),
                      TextFormField(
                        controller: locationReviewController,
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: context.tr.locationReviewHint,
                          labelText: context.tr.locationReviewLabel,
                        ),
                      ),
                      const SizedBox(height: AppLayouts.defaultPadding),
                      Text(
                        context.tr.locationRateLabel,
                        style: context.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: AppLayouts.defaultPadding),
                      AddRatingWidget(
                        onRatingUpdate: (rating) {
                          locationRatesList.value.clear();
                          locationRatesList.value.add(rating);
                        },
                        initialRating: 3,
                      ),
                      const SizedBox(height: AppLayouts.defaultPadding),
                      Text(
                        context.tr.otherServicesLabel,
                        style: context.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: AppLayouts.defaultPadding),
                      AdditionalServicesChipsWidget(
                        onChanged: (value) => selectedServices.value = value,
                      ),
                      const SizedBox(height: AppLayouts.defaultPadding),
                      const Divider(),
                      const SizedBox(height: AppLayouts.defaultPadding),
                      Text(
                        context.tr.addMenuPhotosLabel,
                        style: context.textTheme.bodyLarge,
                      ),
                      if (showEmptyMenuPhotosAlert.value == true) ...[
                        Text(
                          context.tr.emptyLocationMenuPhotosWarning,
                          style: context.textTheme.labelSmall
                              ?.copyWith(color: Colors.red),
                        ),
                      ],
                      const SizedBox(height: AppLayouts.defaultPadding),
                      if (menuPhotos.value.isEmpty)
                        PickImageButton(
                          onPressed: () async {
                            final xPhotosList = await picker.pickMultiImage(
                              requestFullMetadata: false,
                            );
                            final photosList =
                                xPhotosList.map((e) => File(e.path)).toList();

                            menuPhotos.value = photosList;

                            final storageRef = FirebaseStorage.instance
                                .ref()
                                .child(StoragePathways.menuPhotos);

                            for (var i = 0; i < photosList.length; i++) {
                              final ref = storageRef.child(const Uuid().v4());
                              final file = photosList[i];

                              try {
                                await ref.putFile(file);

                                final downloadUrl = await ref.getDownloadURL();

                                dev.log(downloadUrl);
                                menuUrlList.value.add(downloadUrl);
                                dev.log(
                                  menuUrlList.value.length.toString(),
                                );
                              } on FirebaseException catch (e) {
                                dev.log(e.message.toString());
                              }
                            }
                            if (showEmptyMenuPhotosAlert.value == true) {
                              showEmptyMenuPhotosAlert.value =
                                  !showEmptyMenuPhotosAlert.value;
                            }
                          },
                        )
                      else
                        PickedImagesSlider(images: menuPhotos),
                      const SizedBox(height: AppLayouts.defaultPadding),
                      Text(
                        context.tr.addLocationPhotosLabel,
                        style: context.textTheme.bodyLarge,
                      ),
                      if (showEmptyLocationPhotosAlert.value == true) ...[
                        Text(
                          context.tr.emptyLocationPhotosWarning,
                          style: context.textTheme.labelSmall
                              ?.copyWith(color: Colors.red),
                        ),
                      ],
                      const SizedBox(height: AppLayouts.defaultPadding),
                      if (locationPhotos.value.isEmpty)
                        PickImageButton(
                          onPressed: () async {
                            final xPhotosList = await picker.pickMultiImage(
                              requestFullMetadata: false,
                            );
                            final photosList =
                                xPhotosList.map((e) => File(e.path)).toList();

                            locationPhotos.value = photosList;

                            final storageRef = FirebaseStorage.instance
                                .ref()
                                .child(StoragePathways.locationPhotos);

                            for (var i = 0; i < photosList.length; i++) {
                              final ref = storageRef.child(const Uuid().v4());
                              final file = photosList[i];
                              try {
                                await ref.putFile(file);
                                final downloadUrl = await ref.getDownloadURL();
                                dev.log(downloadUrl);
                                locationPhotosUrlList.value.add(downloadUrl);
                                dev.log(
                                  locationPhotosUrlList.value.length.toString(),
                                );
                              } on FirebaseException catch (e) {
                                dev.log(e.message.toString());
                              }
                            }
                            if (showEmptyLocationPhotosAlert.value == true) {
                              showEmptyLocationPhotosAlert.value =
                                  !showEmptyLocationPhotosAlert.value;
                            }
                          },
                        )
                      else
                        PickedImagesSlider(images: locationPhotos),
                      const Divider(),
                      const SizedBox(height: AppLayouts.defaultPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const FormCancelButton(),
                          FormSaveButton(
                            onPressed: () {
                              if (coverPhotoUrl.value.isEmpty) {
                                showEmptyCoverPhotoAlert.value =
                                    !showEmptyCoverPhotoAlert.value;
                              }

                              if (menuUrlList.value.isEmpty) {
                                showEmptyMenuPhotosAlert.value =
                                    !showEmptyMenuPhotosAlert.value;
                              }

                              if (locationPhotosUrlList.value.isEmpty) {
                                showEmptyLocationPhotosAlert.value =
                                    !showEmptyLocationPhotosAlert.value;
                              }

                              if (locationAdressController.text.isEmpty) {
                                showEmptyAddresAlert.value =
                                    !showEmptyAddresAlert.value;
                              }

                              final valid =
                                  formKey.currentState?.validate() ?? false;
                              if (valid == true) {
                                final newLocation = LocationEntity(
                                  locationName: locationNameController.text,
                                  locationId: const Uuid().v4(),
                                  locationDescription:
                                      locationDescriptionController.text,
                                  locationLatitude: latitude.value,
                                  locationLongitude: longitude.value,
                                  locationAdress: locationAdressController.text,
                                  locationWorkingSchedule:
                                      locationScheduleController.text,
                                  locationReviews:
                                      locationReviewController.text,
                                  personWhoAddedLocation:
                                      currentUser?.email ?? '',
                                  dateTimeWhenLocationAdded: DateTime.now(),
                                  locationMenuImages: menuUrlList.value,
                                  locationImages: locationPhotosUrlList.value,
                                  additionalServicesChips:
                                      selectedServices.value,
                                  locationCoverPhoto: coverPhotoUrl.value,
                                  locationRatesList: locationRatesList.value,
                                  rateVotedUsers: [currentUser?.email ?? ''],
                                );

                                LocationRepository()
                                    .addLocation(newLocation.toJson());

                                context.pop();
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
