import 'package:cheapp_and_tasty/auth/pages/sign_in_page.dart';
import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const String route = '/sign-up';

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
        title: const Text(AppStrings.signUp),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppLayouts.defaultPadding),
          child: Column(
            children: [
              const Spacer(),
              Text(
                registrationState,
                style: TextStyle(fontSize: emojiSize),
              ),
              const SizedBox(
                height: AppLayouts.defaultPadding,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: AppStrings.emailFormHint,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: passwordInvisible,
                decoration: InputDecoration(
                  hintText: AppStrings.passwordFormHint,
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
                decoration: const InputDecoration(
                  hintText: AppStrings.nameFormHint,
                ),
              ),
              TextFormField(
                controller: surnameController,
                decoration: const InputDecoration(
                  hintText: AppStrings.surnameFormHint,
                ),
              ),
              const SizedBox(
                height: AppLayouts.defaultPadding,
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
                  GestureDetector(
                    child: const Text(
                      AppStrings.termsAndConditionsCheckBoxText,
                    ),
                    onTap: () {
                      setState(() {
                        termsAndConditions = !termsAndConditions;
                      });
                    },
                  ),
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
                  GestureDetector(
                    child: const Text(AppStrings.receiveEmails),
                    onTap: () {
                      setState(() {
                        newsSubscription = !newsSubscription;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: AppLayouts.defaultPadding,
              ),
              FilledButton(
                onPressed: () {
                  setState(() {
                    registrationState = registrationStateDone;
                    emojiSize = 200;
                  });
                },
                child: const Text(AppStrings.signUp),
              ),
              const SizedBox(
                height: AppLayouts.defaultPadding,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(AppStrings.alreadyHaveAccount),
                  TextButton(
                    child: const Text(AppStrings.signIn),
                    onPressed: () {
                      context.go(SignInPage.route);
                    },
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
