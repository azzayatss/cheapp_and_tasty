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

  bool termsAndConditions = true;
  bool newsSubscription = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppStrings().signInPageTitle,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppLayouts().defaultPadding),
          child: Column(
            children: [
              const Spacer(),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
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
                    Row(
                      children: [
                        Checkbox(
                          value: termsAndConditions,
                          onChanged: (_) {
                            setState(() {
                              termsAndConditions = !termsAndConditions;
                            });
                          },
                        ),
                        AppStrings().termsAndConditionsCheckBoxText,
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: newsSubscription,
                          onChanged: (_) {
                            setState(() {
                              newsSubscription = !newsSubscription;
                            });
                          },
                        ),
                        AppStrings().receiveEmails,
                      ],
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
                      child: AppStrings().signIn,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
