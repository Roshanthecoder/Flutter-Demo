import 'package:flutter/foundation.dart';
import 'package:foodcart/repository/DioRepository.dart';

class AuthViewModel with ChangeNotifier {

  late final DioRepository _repository;
  AuthViewModel(this._repository);
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }


  // Getters for values
  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;

  // Setters for text fields
  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  // Login Functionality

  Future<bool> validateLogin() async {
    if (_email.isEmpty || _password.isEmpty) {
      return false; // Return false if username or password is empty
    }
    setLoading(true);
    try {
      final response = await _repository.postLogin(_email, _password);

      if (response.statusCode == 200) {
        print('Login successful: ${response.data}');
        return true;
      } else {
        print('Login failed: ${response.data}');
        return false;
      }
    } catch (e) {
      print('Error during login: $e');
      return false;
    }
    finally{
      setLoading(false);
    }
  }


  /* Future<bool> validateLogin() async {
    if (_email.isEmpty || _password.isEmpty) {
      return false;
    }
    try {
      final response = await _repository.postLogin(_email, _password);
      if (response.success) {
        final loginResponse = response.data;
        print('Login Successful: ${loginResponse.token}');
        // You can perform further actions like saving token or navigating to another screen
        return true;
      } else {
        print('Login Failed: ${response.error}');
        return false;
      }
    } catch (e) {
      print('Login Exception: $e');
      return false;
    }
  }*/

  // Register Functionality
  bool validateRegister() {
    if (_email.isEmpty || _password.isEmpty || _confirmPassword.isEmpty) {
      return false;
    } else if (_password != _confirmPassword) {
      return false;
    }
    // TODO: Add actual registration logic
    return true;
  }
}
