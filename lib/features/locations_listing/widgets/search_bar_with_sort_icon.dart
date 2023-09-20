import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/locations_listing/controllers/location_list_controller.dart';
import 'package:cheapp_and_tasty/features/locations_listing/enums/sort_options.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchBarWithSortIcon extends HookConsumerWidget {
  const SearchBarWithSortIcon({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final lengthCheck = useState('');
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: context.tr.search,
              hintText: context.tr.search,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: lengthCheck.value == ''
                  ? null
                  : IconButton(
                      onPressed: searchController.clear,
                      icon: const Icon(Icons.clear),
                    ),
            ),
            onChanged: (value) {
              if (value.length < 3) {
                lengthCheck.value = '';
              } else {
                lengthCheck.value = value;
              }

              ref
                  .read(searchBarStateControllerProvider.notifier)
                  .update(lengthCheck.value);
            },
          ),
        ),
        const SortButton(),
      ],
    );
  }
}

// class SortButton extends StatefulWidget {
//   const SortButton({
//     super.key,
//   });

//   @override
//   State<SortButton> createState() => _SortButtonState();
// }

// class _SortButtonState extends State<SortButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton2(
//           customButton: const Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Icon(Icons.sort),
//               Text('Sort by:'),
//             ],
//           ),
//           items: SortOptions.values
//               .map(
//                 (e) => DropdownMenuItem(
//                   value: e,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Icon(e.icon),
//                       Text(e.label),
//                     ],
//                   ),
//                 ),
//               )
//               .toList(),
//           onChanged: (value) {
//             ref.read(sortedValueProvider.notifier).update(value);
//           },
//         ),
//       ),
//     );
//   }
// }

class SortButton extends ConsumerStatefulWidget {
  const SortButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SortButtonState();
}

class _SortButtonState extends ConsumerState<SortButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          customButton: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.sort),
              Text('Sort by:'),
            ],
          ),
          items: SortOptions.values
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(e.icon),
                      Text(e.label),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            ref
                .read(sortedValueProvider.notifier)
                .update(value ?? SortOptions.unsorted);
          },
        ),
      ),
    );
  }
}
