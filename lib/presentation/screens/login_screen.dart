import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../domain/usecases/auth_usecase.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authUseCase = Provider.of<AuthUseCase>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final user = await authUseCase.signInWithEmail(
                  _emailController.text,
                  _passwordController.text,
                );
                if (user != null) {
                  Navigator.pushReplacementNamed(context, '/home', arguments: user.name);
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: FaIcon(FontAwesomeIcons.google, color: Colors.white),
              label: Text('Login with Google', style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () async {
                final user = await authUseCase.signInWithGoogle();
                if (user != null) {
                  Navigator.pushReplacementNamed(context, '/home', arguments: user.name);
                }
              },
            ),
            SizedBox(height: 8),
            ElevatedButton.icon(
              icon: FaIcon(FontAwesomeIcons.apple, color: Colors.white),
              label: Text('Login with Apple', style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () async {
                final user = await authUseCase.signInWithApple();
                if (user != null) {
                  Navigator.pushReplacementNamed(context, '/home', arguments: user.name);
                }
              },
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text('Don\'t have an account? Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
