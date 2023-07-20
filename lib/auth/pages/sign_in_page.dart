import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/app_strings.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String lockedState = '🔐';
  final String unLockedState = '🔓';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings().signIn),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppLayouts().defaultPadding),
          child: Column(
            children: [
              const Spacer(),
              Text(
                lockedState,
                style: const TextStyle(fontSize: 100),
              ),
              SizedBox(
                height: AppLayouts().defaultPadding,
              ),
              TextFormField(),
              TextFormField(),
              SizedBox(
                height: AppLayouts().defaultPadding,
              ),
              SizedBox(
                height: AppLayouts().defaultPadding,
              ),
              FilledButton(
                onPressed: () {
                  setState(() {
                    lockedState = unLockedState;
                  });
                },
                child: Text(AppStrings().signIn),
              ),
              SizedBox(
                height: AppLayouts().defaultPadding,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(AppStrings().dontHaveAccount),
                  TextButton(
                    onPressed: () {},
                    child: Text(AppStrings().signUp),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
