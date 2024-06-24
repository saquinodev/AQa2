import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aqa/providers/auth_provider.dart';
import 'package:aqa/screens/admin_screen.dart';
import 'package:aqa/screens/entrepreneur_screen.dart';
import 'package:aqa/screens/employee_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    if (authProvider.user == null) {
      Navigator.pushReplacementNamed(context, '/login');
      return SizedBox.shrink();
    }

    switch (authProvider.user!.role) {
      case 'admin':
        return AdminScreen();
      case 'entrepreneur':
        return EntrepreneurScreen();
      case 'employee':
        return EmployeeScreen();
      default:
        return Scaffold(
          body: Center(child: Text('Unknown role')),
        );
    }
  }
}
