import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

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

  String chipLabel(BuildContext context) => switch (this) {
        AdditionalServicesChips.parking => context.tr.parkingLabel,
        AdditionalServicesChips.wifi => context.tr.wifiLabel,
        AdditionalServicesChips.delivery => context.tr.deliveryLabel,
        AdditionalServicesChips.terrace => context.tr.terraceLabel,
        AdditionalServicesChips.teakeAway => context.tr.takeAwayLabel,
        AdditionalServicesChips.coffee => context.tr.coffeeLabel,
        AdditionalServicesChips.wc => context.tr.wcLabel,
        AdditionalServicesChips.cardPayments => context.tr.cardPaymentsLabel,
        AdditionalServicesChips.accessibility => context.tr.accessibilityLabel,
        AdditionalServicesChips.charging => context.tr.chargingLabel,
      };
}
