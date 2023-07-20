import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/app_strings.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String registrationState = '📝';
  final String registrationStateDone = '📑';

  bool termsAndConditions = true;
  bool newsSubscription = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings().signUp),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppLayouts().defaultPadding),
          child: Column(
            children: [
              const Spacer(),
              Text(
                registrationState,
                style: const TextStyle(fontSize: 100),
              ),
              SizedBox(
                height: AppLayouts().defaultPadding,
              ),
              TextFormField(),
              TextFormField(),
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
                  Text(AppStrings().termsAndConditionsCheckBoxText),
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
                  Text(AppStrings().receiveEmails),
                ],
              ),
              SizedBox(
                height: AppLayouts().defaultPadding,
              ),
              FilledButton(
                onPressed: () {
                  setState(() {
                    registrationState = registrationStateDone;
                  });
                },
                child: Text(AppStrings().signUp),
              ),
              SizedBox(
                height: AppLayouts().defaultPadding,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(AppStrings().alreadyHaveAccount),
                  TextButton(
                    onPressed: () {},
                    child: Text(AppStrings().signIn),
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
