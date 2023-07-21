import 'package:cheapp_and_tasty/auth/pages/sign_in_page.dart';
import 'package:cheapp_and_tasty/auth/state/auth_state.dart';
import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/config/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SignUpPage extends HookWidget {
  SignUpPage({super.key});

  static const String route = '/sign-up';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final obscureText = useState(true);
    final termsAndConditions = useState(true);
    final newsSubscription = useState(true);
    return LoaderOverlay(
      overlayOpacity: 0.2,
      child: Scaffold(
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: AppLayouts.spacer / 2,
                  ),
                  const Text(
                    AppStrings.signUpEmoji,
                    style: TextStyle(fontSize: AppLayouts.emojiSize),
                  ),
                  const SizedBox(
                    height: AppLayouts.defaultPadding,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: AppStrings.emailFormHint,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: AppLayouts.defaultPadding,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: obscureText.value,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: AppStrings.passwordFormHint,
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () => obscureText.value = !obscureText.value,
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: AppLayouts.defaultPadding,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: AppStrings.nameFormHint,
                    ),
                  ),
                  const SizedBox(
                    height: AppLayouts.defaultPadding,
                  ),
                  TextFormField(
                    controller: surnameController,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: AppStrings.surnameFormHint,
                    ),
                  ),
                  const SizedBox(
                    height: AppLayouts.defaultPadding,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: termsAndConditions.value,
                        onChanged: (_) => termsAndConditions.value =
                            !termsAndConditions.value,
                      ),
                      GestureDetector(
                        child: const Text(
                          AppStrings.termsAndConditionsCheckBoxText,
                        ),
                        onTap: () => termsAndConditions.value =
                            !termsAndConditions.value,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: newsSubscription.value,
                        onChanged: (_) =>
                            newsSubscription.value = !newsSubscription.value,
                      ),
                      GestureDetector(
                        child: const Text(AppStrings.receiveEmails),
                        onTap: () =>
                            newsSubscription.value = !newsSubscription.value,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppLayouts.defaultPadding,
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final signUpProcess = ref.watch(signInControllerProvider);
                      signUpProcess.isLoading
                          ? context.loaderOverlay.show()
                          : context.loaderOverlay.hide();
                      return FilledButton(
                        onPressed: signUpProcess.isLoading
                            ? null
                            : () {
                                ref
                                    .read(signInControllerProvider.notifier)
                                    .signUp(
                                      emailController.text,
                                      passwordController.text,
                                      nameController.text,
                                      surnameController.text,
                                    );
                              },
                        child: const Text(AppStrings.signUp),
                      );
                    },
                  ),
                  const SizedBox(
                    height: AppLayouts.defaultPadding,
                  ),
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
        ),
      ),
    );
  }
}

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   static const String route = '/sign-up';

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final nameController = TextEditingController();
//   final surnameController = TextEditingController();

//   String registrationState = '📝';
//   final String registrationStateDone = '📑';
//   double? emojiSize = 100;

//   bool termsAndConditions = true;
//   bool newsSubscription = true;
//   bool passwordInvisible = true;

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     nameController.dispose();
//     surnameController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(AppStrings.signUp),
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_ios_new,
//           ),
//           onPressed: () {
//             context.go('/');
//           },
//         ),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(AppLayouts.defaultPadding),
//           child: Column(
//             children: [
//               const Spacer(),
//               Text(
//                 registrationState,
//                 style: TextStyle(fontSize: emojiSize),
//               ),
//               const SizedBox(
//                 height: AppLayouts.defaultPadding,
//               ),
//               TextFormField(
//                 controller: emailController,
//                 decoration: const InputDecoration(
//                   hintText: AppStrings.emailFormHint,
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//               ),
//               TextFormField(
//                 controller: passwordController,
//                 obscureText: passwordInvisible,
//                 decoration: InputDecoration(
//                   hintText: AppStrings.passwordFormHint,
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       passwordInvisible
//                           ? Icons.visibility_outlined
//                           : Icons.visibility_off_outlined,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         passwordInvisible = !passwordInvisible;
//                       });
//                     },
//                   ),
//                 ),
//                 keyboardType: TextInputType.visiblePassword,
//               ),
//               TextFormField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                   hintText: AppStrings.nameFormHint,
//                 ),
//               ),
//               TextFormField(
//                 controller: surnameController,
//                 decoration: const InputDecoration(
//                   hintText: AppStrings.surnameFormHint,
//                 ),
//               ),
//               const SizedBox(
//                 height: AppLayouts.defaultPadding,
//               ),
//               Row(
//                 children: [
//                   Checkbox(
//                     value: termsAndConditions,
//                     onChanged: (_) {
//                       setState(() {
//                         termsAndConditions = !termsAndConditions;
//                       });
//                     },
//                   ),
//                   GestureDetector(
//                     child: const Text(
//                       AppStrings.termsAndConditionsCheckBoxText,
//                     ),
//                     onTap: () {
//                       setState(() {
//                         termsAndConditions = !termsAndConditions;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Checkbox(
//                     value: newsSubscription,
//                     onChanged: (_) {
//                       setState(() {
//                         newsSubscription = !newsSubscription;
//                       });
//                     },
//                   ),
//                   GestureDetector(
//                     child: const Text(AppStrings.receiveEmails),
//                     onTap: () {
//                       setState(() {
//                         newsSubscription = !newsSubscription;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: AppLayouts.defaultPadding,
//               ),
//               FilledButton(
//                 onPressed: () {
//                   setState(() {
//                     registrationState = registrationStateDone;
//                     emojiSize = 200;
//                   });
//                 },
//                 child: const Text(AppStrings.signUp),
//               ),
//               const SizedBox(
//                 height: AppLayouts.defaultPadding,
//               ),
//               const Spacer(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   const Text(AppStrings.alreadyHaveAccount),
//                   TextButton(
//                     child: const Text(AppStrings.signIn),
//                     onPressed: () {
//                       context.go(SignInPage.route);
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
