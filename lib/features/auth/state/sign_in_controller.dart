import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> resetPassword(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      state = AsyncValue.error(e, e.stackTrace ?? StackTrace.current);
    }
  }

  Future<void> signInWithEmail(
    String email,
    String password,
    BuildContext context,
  ) async {
    state = const AsyncValue.loading();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
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
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      state = AsyncValue.error(e, e.stackTrace ?? StackTrace.current);
    }
  }

  ///function for logging out from all entities
  Future<void> logOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
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
      await FirebaseAuth.instance.signInWithCredential(
        oauthCredentials,
      );
    } on FirebaseAuthException catch (e) {
      state = AsyncValue.error(e, e.stackTrace ?? StackTrace.current);
    }
  }
}
