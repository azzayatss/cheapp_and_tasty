import 'package:cheapp_and_tasty/features/auth/state/auth_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'is_logged_in_controller.g.dart';

@riverpod
bool isLoggedIn(Ref ref) {
  final user = ref.watch(authStateProvider);
  if (user.value == null) {
    return false;
  }
  return true;
}
