import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/locations_listing/controllers/location_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchBarWithSortIcon extends HookConsumerWidget {
  const SearchBarWithSortIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: context.tr.search,
              hintText: context.tr.search,
              prefixIcon: const Icon(Icons.search),
            ),
            onChanged: (value) {
              ref.read(searchBarStateControllerProvider.notifier).update(value);
            },
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.sort),
        ),
      ],
    );
  }
}
