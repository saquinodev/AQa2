import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aqa/providers/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('AQa - Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await authProvider.signInWithGoogle();
            if (authProvider.user != null) {
              Navigator.pushReplacementNamed(context, '/home');
            }
          },
          child: Text('Sign in with Google'),
        ),
      ),
    );
  }
}
