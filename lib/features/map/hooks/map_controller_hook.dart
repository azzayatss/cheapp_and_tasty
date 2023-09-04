import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Own hook to auto-dispose controller based on "useFocusNodeHook" example
CustomInfoWindowController useCustomInfoWindowController() {
  return use(
    const _CustomInfoWindowControllerHook(),
  );
}

class _CustomInfoWindowControllerHook extends Hook<CustomInfoWindowController> {
  const _CustomInfoWindowControllerHook();

  @override
  _CustomInfoWindowControllerHookState createState() {
    return _CustomInfoWindowControllerHookState();
  }
}

class _CustomInfoWindowControllerHookState extends HookState<
    CustomInfoWindowController, _CustomInfoWindowControllerHook> {
  late final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  @override
  CustomInfoWindowController build(BuildContext context) =>
      _customInfoWindowController;

  @override
  void dispose() => _customInfoWindowController.dispose();

  @override
  String get debugLabel => 'useCustomInfoWindowController';
}
