import 'package:demo_comsci/firebase_options.dart';
import 'package:demo_comsci/src/home.dart';
import 'package:demo_comsci/src/login.dart';
import 'package:demo_comsci/src/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rebirth/rebirth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetRebirth(
      materialApp: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: Home.route,
        routes: {
          Register.route: (context) => const Register(),
          Login.route: (context) => const Login(),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}
