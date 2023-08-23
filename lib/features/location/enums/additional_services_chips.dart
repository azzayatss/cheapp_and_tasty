import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  String chipLabel(AppLocalizations tr) => switch (this) {
        AdditionalServicesChips.parking => tr.parkingLabel,
        AdditionalServicesChips.wifi => tr.wifiLabel,
        AdditionalServicesChips.delivery => tr.deliveryLabel,
        AdditionalServicesChips.terrace => tr.terraceLabel,
        AdditionalServicesChips.teakeAway => tr.takeAwayLabel,
        AdditionalServicesChips.coffee => tr.coffeeLabel,
        AdditionalServicesChips.wc => tr.wcLabel,
        AdditionalServicesChips.cardPayments => tr.cardPaymentsLabel,
        AdditionalServicesChips.accessibility => tr.accessibilityLabel,
        AdditionalServicesChips.charging => tr.chargingLabel,
      };
}
