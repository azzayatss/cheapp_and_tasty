import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/app_strings.dart';
import 'package:cheapp_and_tasty/features/auth/widgets/sign_in_form.dart';
import 'package:cheapp_and_tasty/features/auth/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AuthGateScreen extends HookWidget {
  const AuthGateScreen({super.key});

  static const String route = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppLayouts.defaultPadding),
          child: DefaultTabController(
            length: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TabBar(
                  tabs: [
                    Tab(text: AppStrings.signIn),
                    Tab(text: AppStrings.signUp),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SignInForm(),
                      SignUpForm(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
