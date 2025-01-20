import 'package:flutter/material.dart';
import 'package:foodcart/viewmodels/AuthViewModel.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: viewModel.setEmail,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              onChanged: viewModel.setPassword,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            TextField(
              onChanged: viewModel.setConfirmPassword,
              decoration: InputDecoration(labelText: "Confirm Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (viewModel.validateRegister()) {
                  // Navigate to Home or dashboard after successful registration
                } else {
                  print("Invalid Registration");
                }
              },
              child: Text("Register"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Already have an account? Login here"),
            ),
          ],
        ),
      ),
    );
  }
}
