import 'package:cheapp_and_tasty/config/app_strings.dart';
import 'package:cheapp_and_tasty/features/auth/config/firebase_options.dart';
import 'package:cheapp_and_tasty/features/auth/pages/sign_in_page.dart';
import 'package:cheapp_and_tasty/features/auth/pages/sign_up_page.dart';
import 'package:cheapp_and_tasty/features/router/go_router_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appBarTitle,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigoAccent,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      routerConfig: Routes.router,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  static const route = '/';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('app title'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            child: const Text(
              AppStrings.signIn,
            ),
            onPressed: () {
              context.go(SignInPage.route);
            },
          ),
          TextButton(
            child: const Text(
              AppStrings.signUp,
            ),
            onPressed: () {
              context.go(SignUpPage.route);
            },
          ),
        ],
      ),
    );
  }
}
