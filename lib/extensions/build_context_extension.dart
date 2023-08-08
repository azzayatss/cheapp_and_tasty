import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// A set of useful [BuildContext] extensions
extension BuildContextX on BuildContext {
  /// Extension for quickly accessing generated localization getters
  AppLocalizations get tr => AppLocalizations.of(this)!;
}
