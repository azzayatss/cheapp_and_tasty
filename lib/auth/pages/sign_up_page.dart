import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/app_strings.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();

  String registrationState = '📝';
  final String registrationStateDone = '📑';
  double? emojiSize = 100;

  bool termsAndConditions = true;
  bool newsSubscription = true;
  bool passwordInvisible = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    surnameController.dispose();
    super.dispose();
  }

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
                style: TextStyle(fontSize: emojiSize),
              ),
              SizedBox(
                height: AppLayouts().defaultPadding,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: AppStrings().emailFormHint,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: passwordInvisible,
                decoration: InputDecoration(
                  hintText: AppStrings().passwordFormHint,
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordInvisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordInvisible = !passwordInvisible;
                      });
                    },
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: AppStrings().nameFormHint,
                ),
              ),
              TextFormField(
                controller: surnameController,
                decoration: InputDecoration(
                  hintText: AppStrings().surnameFormHint,
                ),
              ),
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
                    emojiSize = 200;
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
