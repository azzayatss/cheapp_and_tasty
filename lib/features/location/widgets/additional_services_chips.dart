import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/enums/additional_services_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AdditionalServicesChipsWidget extends HookWidget {
  const AdditionalServicesChipsWidget({
    required this.onChanged,
    super.key,
  });

  final ValueChanged<List<String>> onChanged;

  @override
  Widget build(BuildContext context) {
    final selectedState = useReducer<List<String>, String>(
      (state, value) {
        if (state.contains(value)) {
          return [...state..remove(value)];
        } else {
          return [...state..add(value)];
        }
      },
      initialState: [],
      initialAction: '',
    );
    return Wrap(
      spacing: AppLayouts.defaultPadding / 3,
      children: AdditionalServicesChips.values
          .map(
            (value) => GestureDetector(
              onTap: () {
                selectedState.dispatch(value.name);
                onChanged(selectedState.state);
              },
              child: Chip(
                backgroundColor: selectedState.state.contains(value.name)
                    ? context.colorScheme.primary
                    : null,
                labelStyle: selectedState.state.contains(value.name)
                    ? TextStyle(
                        color: context.colorScheme.onPrimary,
                      )
                    : null,
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      value.icon,
                      color: selectedState.state.contains(value.name)
                          ? context.colorScheme.onPrimary
                          : null,
                      size: 16,
                    ),
                    const SizedBox(
                      width: AppLayouts.defaultPadding / 2,
                    ),
                    Text(value.chipLabel(context.tr)),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
