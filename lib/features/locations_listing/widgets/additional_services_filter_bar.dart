import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/enums/additional_services_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdditionalServicesFilterBar extends HookConsumerWidget {
  const AdditionalServicesFilterBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChips = useState<Map<AdditionalServicesChips, bool>>({
      for (final i in AdditionalServicesChips.values) i: false,
    });

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AdditionalServicesChips.values.length,
        itemBuilder: (context, index) {
          final chip = AdditionalServicesChips.values[index];
          final isSelected = selectedChips.value[chip] ?? false;
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
                selectedChips.value =
                    Map.from(selectedChips.value..[chip] = selected);
              },
            ),
          );
        },
      ),
    );
  }
}
