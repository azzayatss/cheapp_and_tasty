import 'package:cheapp_and_tasty/config/app_colors.dart';
import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/locations_listing/controllers/chip_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddNewLocationScreen extends HookConsumerWidget {
  const AddNewLocationScreen({super.key});
  static const String route = 'add-new-location';
  static const String routeName = 'addNewLocation';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(chipControllerProvider);
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
                          //todo azzayats: підключити завантаження з девайсу, продумати аплоад в бд, продумати прийом з бд.
                          //todo azzayats: добавити всі стрінги в переклади
                          'Головне фото локації:',
                          style: context.textTheme.bodyLarge,
                        ),
                        const SizedBox(height: AppLayouts.defaultPadding),
                        Align(
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.image_outlined),
                            label: const Text('Завантажити фото'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppLayouts.defaultPadding),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Пузата Хата',
                        labelText: 'Назва локації',
                      ),
                    ),
                    const SizedBox(height: AppLayouts.defaultPadding),
                    TextFormField(
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        hintText:
                            'Їдальня університету ім. Івана Франка, вхід через корпус №2, одразу після входу по сходах вниз.',
                        labelText: 'Опис локації',
                      ),
                    ),
                    const SizedBox(height: AppLayouts.defaultPadding),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'м.Львів, вул.Червоної Калини 72',
                        labelText: 'Адреса локації',
                      ),
                    ),
                    const SizedBox(height: AppLayouts.defaultPadding),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'пн-пт: 10:00-17:00; сб-нд: вихідні',
                        labelText: 'Графік роботи',
                      ),
                    ),
                    const SizedBox(height: AppLayouts.defaultPadding),
                    TextFormField(
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        hintText:
                            'Поділіться своїми враженнями про цю локацію, допоможіть іншим обрати його для відвідування.',
                        labelText: 'Перший відгук',
                      ),
                    ),
                    const SizedBox(height: AppLayouts.defaultPadding),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Вкажіть початковий рейтинг:',
                          style: context.textTheme.bodyLarge,
                        ),
                        const SizedBox(height: AppLayouts.defaultPadding),
                        Align(
                          child: RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            allowHalfRating: true,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: AppColors.starIconColor,
                            ),
                            onRatingUpdate: print,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppLayouts.defaultPadding),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          //todo azzayats: скоротити код(оптимізувати), подумати як передавати, подумати як приймати і відображати.
                          'Інші послуги:',
                          style: context.textTheme.bodyLarge,
                        ),
                        const SizedBox(height: AppLayouts.defaultPadding),
                        Wrap(
                          spacing: AppLayouts.defaultPadding / 3,
                          children: AdditionalServicesChips.values
                              .map(
                                (value) => GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(chipControllerProvider.notifier)
                                        .addRemoveToList(value.name);
                                  },
                                  child: Chip(
                                    backgroundColor: list.contains(value.name)
                                        ? Colors.green
                                        : null,
                                    label: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          value.icon,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: AppLayouts.defaultPadding / 2,
                                        ),
                                        Text(value.chipLabel(context)),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: AppLayouts.defaultPadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              //todo azzayats: підключити завантаження з девайсу, продумати аплоад в бд, продумати прийом з бд.
                              'Добавте кілька фото меню:',
                              style: context.textTheme.bodyLarge,
                            ),
                            const SizedBox(height: AppLayouts.defaultPadding),
                            Align(
                              child: TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.image_outlined),
                                label: const Text('Завантажити фото'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppLayouts.defaultPadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              //todo azzayats: підключити завантаження з девайсу, продумати аплоад в бд, продумати прийом з бд.
                              'Добавте кілька фото закладу:',
                              style: context.textTheme.bodyLarge,
                            ),
                            const SizedBox(height: AppLayouts.defaultPadding),
                            Align(
                              child: TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.image_outlined),
                                label: const Text('Завантажити фото'),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: AppLayouts.defaultPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OutlinedButton(
                              onPressed: () {},
                              child: const Text('Відмінити'),
                            ),
                            FilledButton(
                              onPressed: () {},
                              child: const Text('Зберегти'),
                            ),
                          ],
                        )
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

enum AdditionalServicesChips {
  parking(
    icon: Icons.local_parking_outlined,
  ),
  wifi(
    icon: Icons.wifi,
  ),
  delivery(
    icon: Icons.delivery_dining_outlined,
  ),
  terrace(
    icon: Icons.nature_outlined,
  ),
  teakeAway(
    icon: Icons.takeout_dining_outlined,
  ),
  coffee(
    icon: Icons.coffee_outlined,
  ),
  wc(
    icon: Icons.wc,
  ),
  cardPayments(
    icon: Icons.credit_card,
  ),
  accessibility(
    icon: Icons.accessible,
  ),
  charging(
    icon: Icons.charging_station_outlined,
  );

  const AdditionalServicesChips({
    required this.icon,
  });

  final IconData icon;

  String chipLabel(BuildContext context) => switch (this) {
        AdditionalServicesChips.parking => context.tr.parkingLabel,
        AdditionalServicesChips.wifi => context.tr.wifiLabel,
        AdditionalServicesChips.delivery => context.tr.deliveryLabel,
        AdditionalServicesChips.terrace => context.tr.terraceLabel,
        AdditionalServicesChips.teakeAway => context.tr.takeAwayLabel,
        AdditionalServicesChips.coffee => context.tr.coffeeLabel,
        AdditionalServicesChips.wc => context.tr.wcLabel,
        AdditionalServicesChips.cardPayments => context.tr.cardPaymentsLabel,
        AdditionalServicesChips.accessibility => context.tr.accessibilityLabel,
        AdditionalServicesChips.charging => context.tr.chargingLabel,
      };
}

//  void _onTap(int index)
//    => switch(index){
//        0 => context.go('location0'),
//        1 => context.go('location1'),
//        2 => context.go('location2'),
//        _ => ''
//     };

// final newLocation = LocationEntity(
//   locationId: '222222',
//   locationName: 'test name2',
//   locationDescription: 'test description',
//   locationAdress: 'проспект Свободи 5',
//   locationLatitude: 10,
//   locationLongitude: 10,
//   locationWorkingSchedule:
//       'пн-пт: 10:00-17:00; сб-нд: вихідні',
//   locationReviews: 'test review',
//   locationRate: 5,
//   personWhoAddedLocation: 'andrii zajats',
//   dateTimeWhenLocationAdded: DateTime.now(),
//   doesLocationHaveDelivery: false,
//   doesLocationHaveTakeAway: false,
//   doesLocationHaveOwnParking: false,
//   doesLocationHaveCardPayments: false,
//   locationMenuImages: <String>[
//     // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//     // 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//     // 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//     // 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//     // 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//     // 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
//   ],
//   locationImages: <String>[
//     'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//     'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//     'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//     'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//     'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//     'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
//   ],
//   locationCoverPhoto:
//       'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
// );
// ref
//     .read(globalLocationsListControllerProvider.notifier)
//     .add(newLocation);
