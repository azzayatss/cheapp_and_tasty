import 'package:cheapp_and_tasty/config/app_layouts.dart';
import 'package:cheapp_and_tasty/extensions/build_context_extension.dart';
import 'package:cheapp_and_tasty/features/auth/controllers/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpForm extends HookWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final showEmptyTermsAndConditionsWarning = useState(false);
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final obscureText = useState(true);
    final termsAndConditions = useState(false);
    final newsSubscription = useState(true);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppLayouts.defaultPadding),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  label: Text(context.tr.login),
                  hintText: context.tr.emailFormHint,
                ),
                keyboardType: TextInputType.emailAddress,
                validator: ValidationBuilder()
                    .required()
                    .email()
                    .maxLength(50)
                    .build(),
              ),
              const SizedBox(
                height: AppLayouts.defaultPadding,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: obscureText.value,
                decoration: InputDecoration(
                  label: Text(context.tr.password),
                  hintText: context.tr.passwordFormHint,
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
                validator: ValidationBuilder().required().minLength(6).build(),
              ),
              const SizedBox(
                height: AppLayouts.defaultPadding / 2,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        side: showEmptyTermsAndConditionsWarning.value == true
                            ? MaterialStateBorderSide.resolveWith(
                                (states) => const BorderSide(color: Colors.red),
                              )
                            : null,
                        value: termsAndConditions.value,
                        onChanged: (_) {
                          termsAndConditions.value = !termsAndConditions.value;

                          if (showEmptyTermsAndConditionsWarning.value ==
                              true) {
                            showEmptyTermsAndConditionsWarning.value =
                                !showEmptyTermsAndConditionsWarning.value;
                          }
                        },
                      ),
                      GestureDetector(
                        child: Text(
                          context.tr.termsAndConditionsCheckBoxText,
                        ),
                        onTap: () => termsAndConditions.value =
                            !termsAndConditions.value,
                      ),
                    ],
                  ),
                  if (showEmptyTermsAndConditionsWarning.value ==
                      true) ...<Widget>[
                    Row(
                      children: [
                        const SizedBox(
                          width: AppLayouts.defaultPadding * 3,
                        ),
                        Expanded(
                          child: Text(
                            context.tr.emptyTermsAndConditionsWarning,
                            style: context.textTheme.labelSmall!
                                .copyWith(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ],
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
                    child: Text(
                      context.tr.receiveEmails,
                    ),
                    onTap: () =>
                        newsSubscription.value = !newsSubscription.value,
                  ),
                ],
              ),
              const SizedBox(
                height: AppLayouts.defaultPadding / 2,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final signUpProcess = ref.watch(signInControllerProvider);
                  return FilledButton(
                    onPressed: signUpProcess.isLoading
                        ? null
                        : () {
                            if (termsAndConditions.value == true) {
                              final valid =
                                  formKey.currentState?.validate() ?? false;
                              if (valid == true) {
                                ref
                                    .read(signInControllerProvider.notifier)
                                    .signUp(
                                      emailController.text,
                                      passwordController.text,
                                      context,
                                    );
                              }
                            } else {
                              showEmptyTermsAndConditionsWarning.value =
                                  !showEmptyTermsAndConditionsWarning.value;
                            }
                          },
                    child: Text(context.tr.signUp),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
