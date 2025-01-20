import 'package:flutter/material.dart';
import 'package:foodcart/screens/Home.dart';
import 'package:foodcart/screens/Register.dart';
import 'package:foodcart/utils/SnackbarToast.dart';
import 'package:foodcart/viewmodels/AuthViewModel.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool loginSuccess = await viewModel.validateLogin();
                if (loginSuccess) {
                  SnackbarToast.showSnackBar(context, "login sucesss");
                  // Navigate to the Home screen on successful login
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                } else {
                  // Show snackbar for login failure
                  SnackbarToast.showSnackBar(context, "Invalid email or password. Please try again.");
                }
              },
              child: Text("Login"),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterView()),
                );
              },
              child: Text("Don't have an account? Register here"),
            ),
            if (viewModel.isLoading)
              Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
