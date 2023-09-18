import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  @override
  FutureOr<User?> build() {
    return FirebaseAuth.instance.currentUser;
  }

  Future<void> signInWithEmail(
    String email,
    String password,
    BuildContext context,
  ) async {
    state = const AsyncValue.loading();

    try {
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      state = AsyncValue.data(result.user);
    } on FirebaseAuthException catch (e) {
      state = AsyncValue.error(e, e.stackTrace ?? StackTrace.current);
    }
  }

  Future<void> signUp(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      state = AsyncValue.data(result.user);
    } on FirebaseAuthException catch (e) {
      state = AsyncValue.error(e, e.stackTrace ?? StackTrace.current);
    }
  }

  ///function for logging out from all auth providers
  Future<void> logOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      state = const AsyncValue.data(null);
    } on FirebaseAuthException catch (e) {
      state = AsyncValue.error(e, e.stackTrace ?? StackTrace.current);
    }
  }

  Future<void> loginWithGoogle(BuildContext context) async {
    final googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    ///this command will show sign in dialog to the user
    final signInAccount = await googleSignIn.signIn();
    final googleAuth = await signInAccount?.authentication;
    final oauthCredentials = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    try {
      final result = await FirebaseAuth.instance.signInWithCredential(
        oauthCredentials,
      );

      state = AsyncValue.data(result.user);
    } on FirebaseAuthException catch (e) {
      state = AsyncValue.error(e, e.stackTrace ?? StackTrace.current);
    }
  }
}

@riverpod
class ResetPassword extends _$ResetPassword {
  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<void> resetPassword(String email) async {
    state = const AsyncLoading();
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      state = const AsyncData(true);
    } on FirebaseAuthException catch (e) {
      state = AsyncValue.error(e, e.stackTrace ?? StackTrace.current);
    }
  }
}
