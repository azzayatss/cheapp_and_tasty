import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/entities/location_entity.dart';
import 'package:cheapp_and_tasty/features/location/enums/additional_services_chips.dart';
import 'package:cheapp_and_tasty/features/locations_listing/controllers/location_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdditionalServicesFilterBar extends HookConsumerWidget {
  const AdditionalServicesFilterBar({
    required this.allLocationsList,
    super.key,
  });

  final List<LocationEntity> allLocationsList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generedList =
        List.generate(AdditionalServicesChips.values.length, (index) => false);
    final chipsIsSelected = useState<List<bool>>(generedList);

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AdditionalServicesChips.values.length,
        itemBuilder: (context, index) {
          final isSelected = chipsIsSelected.value[index];
          final chip = AdditionalServicesChips.values[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppLayouts.defaultPadding / 8,
            ),
            child: FilterChip(
              avatar: isSelected ? null : Icon(chip.icon),
              selected: isSelected,
              label: Text(
                chip.chipLabel(context.tr),
              ),
              onSelected: (selected) {
                chipsIsSelected.value = [
                  ...chipsIsSelected.value..[index] = selected,
                ];
                ref.read(filteredLocationsListProvider.notifier).filter(
                      chipsIsSelected.value,
                      allLocationsList,
                      context,
                    );
              },
            ),
          );
        },
      ),
    );
  }
}
