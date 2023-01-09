import 'package:financy_app/common/constants/routes.dart';
import 'package:financy_app/services/secure_storage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _secureStorage = const SecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Nova Tela!'),
            ElevatedButton(
              onPressed: () {
                _secureStorage.deleteOne(key: 'CURRENT_USER').then(
                      (_) => Navigator.popAndPushNamed(
                          context, NamedRoute.initial),
                    );
              },
              child: const Text('LogOut'),
            ),
          ],
        ),
      ),
    );
  }
}
