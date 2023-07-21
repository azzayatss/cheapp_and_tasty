import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state.g.dart';

@riverpod
class SignInController extends _$SignInController {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncLoading();
    try {
      //login code from firebase
      await Future<void>.delayed(const Duration(seconds: 3));
      // throw Exception();
      print('log:$email + pas:$password');
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> signUp(
    String email,
    String password,
    String name,
    String surname,
  ) async {
    state = const AsyncLoading();
    try {
      //login code from firebase
      await Future<void>.delayed(const Duration(seconds: 3));
      // throw Exception();
      print('$email $password $name $surname');
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
