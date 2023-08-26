import 'dart:developer' as dev;
import 'dart:io';

import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/theme/app_colors.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/auth/controllers/sign_in_controller.dart';
// import 'package:cheapp_and_tasty/features/location/add_location/controllers/menu_images_controller.dart';
import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:cheapp_and_tasty/features/location/locations_listing/screens/locations_listing_screen.dart';
import 'package:cheapp_and_tasty/features/location/repositories/locations_repository.dart';
import 'package:cheapp_and_tasty/features/location/widgets/additional_services_chips.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
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
    final currentUser = ref.read(signInControllerProvider);
    final locationNameController = useTextEditingController();
    final locationDescriptionController = useTextEditingController();
    final locationAdressController = useTextEditingController();
    final locationScheduleController = useTextEditingController();
    final locationReviewController = useTextEditingController();
    final selectedServices = useRef(<String>[]);
    final initialRate = useState<double>(3);
    final menuUrlList = useState<List<String>>([]);
    final menuPhotos = useState<List<File?>>([]);
    final locationPhotosUrlList = useState<List<String>>([]);
    final locationPhotos = useState<List<File?>>([]);
    final coverPhotoUrl = useState<String>('');
    final coverPhoto = useState<File?>(null);

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.tr.coverPhotoLabel,
                          style: context.textTheme.bodyLarge,
                        ),
                        const SizedBox(height: AppLayouts.defaultPadding),
                        if (coverPhoto.value == null)
                          Align(
                            child: TextButton.icon(
                              onPressed: () async {
                                final xPhoto = await picker.pickImage(
                                  source: ImageSource.gallery,
                                  requestFullMetadata: false,
                                );
                                final photo = File(xPhoto!.path);
                                coverPhoto.value = photo;
                                final storageRef = FirebaseStorage.instance
                                    .ref()
                                    .child('cover_photos/');
                                final ref = storageRef.child(const Uuid().v4());
                                try {
                                  await ref.putFile(photo);
                                  final downloadUrl =
                                      await ref.getDownloadURL();
                                  dev.log(downloadUrl);
                                  coverPhotoUrl.value = downloadUrl;
                                } on FirebaseException catch (e) {
                                  dev.log(e.message.toString());
                                }
                              },
                              icon: const Icon(Icons.image_outlined),
                              label: Text(context.tr.uploadPhotoLabel),
                            ),
                          )
                        else
                          Center(
                            child: Image.file(
                              coverPhoto.value!,
                              width: 300,
                              height: 300,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: AppLayouts.defaultPadding),
                    TextFormField(
                      controller: locationNameController,
                      decoration: InputDecoration(
                        hintText: context.tr.locationNameHint,
                        labelText: context.tr.locationNameLabel,
                      ),
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
                    TextFormField(
                      controller: locationAdressController,
                      decoration: InputDecoration(
                        hintText: context.tr.locationAdressHint,
                        labelText: context.tr.locationAdressLabel,
                      ),
                    ),
                    const SizedBox(height: AppLayouts.defaultPadding),
                    TextFormField(
                      controller: locationScheduleController,
                      decoration: InputDecoration(
                        hintText: context.tr.locationScheduleHint,
                        labelText: context.tr.locationScheduleLabel,
                      ),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.tr.locationRateLabel,
                          style: context.textTheme.bodyLarge,
                        ),
                        const SizedBox(height: AppLayouts.defaultPadding),
                        Align(
                          child: RatingBar.builder(
                            initialRating: initialRate.value,
                            minRating: 1,
                            allowHalfRating: true,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: AppColors.starIconColor,
                            ),
                            onRatingUpdate: (rating) {
                              initialRate.value = rating;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppLayouts.defaultPadding),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.tr.otherServicesLabel,
                          style: context.textTheme.bodyLarge,
                        ),
                        const SizedBox(height: AppLayouts.defaultPadding),
                        AdditionalServicesChipsWidget(
                          onChanged: (value) => selectedServices.value = value,
                        ),
                        const SizedBox(height: AppLayouts.defaultPadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.tr.addMenuPhotosLabel,
                              style: context.textTheme.bodyLarge,
                            ),
                            const SizedBox(height: AppLayouts.defaultPadding),
                            if (menuPhotos.value.isEmpty)
                              Align(
                                child: TextButton.icon(
                                  onPressed: () async {
                                    final xPhotosList =
                                        await picker.pickMultiImage(
                                      requestFullMetadata: false,
                                    );
                                    final photosList = xPhotosList
                                        .map((e) => File(e.path))
                                        .toList();

                                    menuPhotos.value = photosList;

                                    // ref
                                    //     .read(
                                    //       menuImagesControllerProvider.notifier,
                                    //     )
                                    //     .addList(photosList);

                                    final storageRef = FirebaseStorage.instance
                                        .ref()
                                        .child('menu_photos/');

                                    for (var i = 0;
                                        i < photosList.length;
                                        i++) {
                                      final ref =
                                          storageRef.child(const Uuid().v4());
                                      final file = photosList[i];

                                      try {
                                        await ref.putFile(file);

                                        final downloadUrl =
                                            await ref.getDownloadURL();

                                        dev.log(downloadUrl);
                                        menuUrlList.value.add(downloadUrl);
                                        dev.log(
                                          menuUrlList.value.length.toString(),
                                        );
                                      } on FirebaseException catch (e) {
                                        dev.log(e.message.toString());
                                      }
                                    }
                                  },
                                  icon: const Icon(Icons.image_outlined),
                                  label: Text(context.tr.uploadPhotoLabel),
                                ),
                              )
                            else
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: menuPhotos.value.map((e) {
                                    return Padding(
                                      padding: const EdgeInsets.all(
                                        AppLayouts.defaultPadding / 3,
                                      ),
                                      child: Image.file(
                                        e!,
                                        width: 150,
                                        height: 150,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                          ],
                        ),
                        const SizedBox(height: AppLayouts.defaultPadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.tr.addLocationPhotosLabel,
                              style: context.textTheme.bodyLarge,
                            ),
                            const SizedBox(height: AppLayouts.defaultPadding),
                            if (locationPhotos.value.isEmpty)
                              Align(
                                child: TextButton.icon(
                                  onPressed: () async {
                                    final xPhotosList =
                                        await picker.pickMultiImage(
                                      requestFullMetadata: false,
                                    );
                                    final photosList = xPhotosList
                                        .map((e) => File(e.path))
                                        .toList();

                                    locationPhotos.value = photosList;

                                    // ref
                                    //     .read(
                                    //       menuImagesControllerProvider.notifier,
                                    //     )
                                    //     .addList(photosList);

                                    final storageRef = FirebaseStorage.instance
                                        .ref()
                                        .child('location_photos/');

                                    for (var i = 0;
                                        i < photosList.length;
                                        i++) {
                                      final ref =
                                          storageRef.child(const Uuid().v4());
                                      final file = photosList[i];
                                      try {
                                        await ref.putFile(file);
                                        final downloadUrl =
                                            await ref.getDownloadURL();
                                        dev.log(downloadUrl);
                                        locationPhotosUrlList.value
                                            .add(downloadUrl);
                                        dev.log(
                                          menuUrlList.value.length.toString(),
                                        );
                                      } on FirebaseException catch (e) {
                                        dev.log(e.message.toString());
                                      }
                                    }
                                  },
                                  icon: const Icon(Icons.image_outlined),
                                  label: Text(context.tr.uploadPhotoLabel),
                                ),
                              )
                            else
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: locationPhotos.value.map((e) {
                                    return Padding(
                                      padding: const EdgeInsets.all(
                                        AppLayouts.defaultPadding / 3,
                                      ),
                                      child: Image.file(
                                        e!,
                                        width: 150,
                                        height: 150,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: AppLayouts.defaultPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                showDialog<AlertDialog>(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(context.tr.areYouSure),
                                      content: Text(
                                        context.tr.areYouSureDescription,
                                      ),
                                      actions: [
                                        FilledButton(
                                          onPressed: () => context.pop(),
                                          child: Text(
                                            context.tr.continiueCreating,
                                          ),
                                        ),
                                        OutlinedButton(
                                          onPressed: () {
                                            context
                                              ..pop()
                                              ..go(LocationsListScreen.route);
                                          },
                                          child:
                                              Text(context.tr.cancelCreating),
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text(context.tr.cancel),
                            ),
                            FilledButton(
                              onPressed: () {
                                final newLocation = LocationEntity(
                                  locationName: locationNameController.text,
                                  locationId: const Uuid().v4(),
                                  locationDescription:
                                      locationDescriptionController.text,
                                  //todo azzayats -> replace hardcoded values with add on map feature in future
                                  locationLatitude: 0,
                                  locationLongitude: 0,
                                  locationAdress: locationAdressController.text,
                                  locationWorkingSchedule:
                                      locationScheduleController.text,
                                  locationReviews:
                                      locationReviewController.text,
                                  locationRate: initialRate.value,
                                  personWhoAddedLocation:
                                      currentUser.value?.email ?? '',
                                  dateTimeWhenLocationAdded: DateTime.now(),
                                  locationMenuImages: menuUrlList.value,
                                  locationImages: locationPhotosUrlList.value,
                                  additionalServicesChips:
                                      selectedServices.value,
                                  locationCoverPhoto: coverPhotoUrl.value,
                                );

                                LocationRepository()
                                    .addLocation(newLocation.toJson());

                                context.pop();
                              },
                              child: Text(context.tr.save),
                            ),
                          ],
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
    );
  }
}
