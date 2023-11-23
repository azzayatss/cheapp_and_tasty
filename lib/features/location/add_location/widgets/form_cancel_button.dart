import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/location/locations_listing/screens/locations_listing_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FormCancelButton extends StatelessWidget {
  const FormCancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
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
                  child: Text(context.tr.cancelCreating),
                ),
              ],
            );
          },
        );
      },
      child: Text(context.tr.cancel),
    );
  }
}
