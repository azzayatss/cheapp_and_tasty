// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'rate_controller.g.dart';

// @riverpod
// class RateController extends _$RateController {
//   @override
//   FutureOr<double> build() {
//     return 0;
//   }

// void getRate({List<double>? rateList}) {
//   if (rateList == null) {
//     return;
//   }

//   if (rateList.length == 1) {
//     state = AsyncData(rateList.first);
//   } else {
//     var rates = 0.0;
//     for (var i = 0; i < rateList.length; i++) {
//       rates = rates + rateList[i];
//     }
//     state = AsyncData(rates / rateList.length);
//   }
// }
// }

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rate_controller.g.dart';

@riverpod
FutureOr<double> rateController(
  RateControllerRef ref, {
  List<double>? rateList,
}) {
  // return 0.0;

  if (rateList == null) {
    return 0;
  }

  if (rateList.length == 1) {
    return rateList.first;
  } else {
    var rates = 0.0;
    for (var i = 0; i < rateList.length; i++) {
      rates = rates + rateList[i];
    }
    return rates / rateList.length;
  }
}
