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
  double? emojiSize = 100;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool passwordInvisible = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                    emojiSize = 200;
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
