import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/features/location/enums/additional_services_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AdditionalServicesFilterBar extends HookWidget {
  const AdditionalServicesFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
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
                chip.name,
              ),
              onSelected: (selected) {
                chipsIsSelected.value = [
                  ...chipsIsSelected.value..[index] = selected,
                ];
              },
            ),
          );
        },
      ),
    );
  }
}
