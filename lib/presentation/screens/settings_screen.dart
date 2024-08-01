import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/usecases/auth_usecase.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authUseCase = Provider.of<AuthUseCase>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await authUseCase.signOut();
                Navigator.pushReplacementNamed(context, '/');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text('Logout', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
