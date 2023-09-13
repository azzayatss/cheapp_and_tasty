import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBarForUser({
  required BuildContext context,
  required String errorTitle,
  required String? errorMessage,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            errorTitle,
          ),
          Text(
            errorMessage ?? '',
          ),
        ],
      ),
    ),
  );
}