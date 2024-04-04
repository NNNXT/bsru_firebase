import 'package:demo_comsci/src/login.dart';
import 'package:demo_comsci/src/register.dart';
import 'package:flutter/material.dart';
import 'package:rebirth/rebirth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  static const String route = '/';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getUserData();
    });
  }

  String? _username;

  @override
  Widget build(BuildContext context) {
    return _username == null
        ? const SizedBox.shrink()
        : Scaffold(
            body: (_username ?? '').isEmpty
                ? Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Login.route);
                          },
                          child: const Text('Login'),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Register.route);
                          },
                          child: const Text('Register'),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.clear();
                        if (!context.mounted) return;
                        WidgetRebirth.createRebirth(context: context);
                      },
                      child: const Text('Logout'),
                    ),
                  ),
          );
  }

  Future<void> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? '';
    });
  }
}
