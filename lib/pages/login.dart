import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:plumber_project/pages/dashboard.dart';
import 'package:plumber_project/pages/electrition_dashboard.dart';
import 'package:plumber_project/pages/plumber_dashboard.dart';
import 'package:plumber_project/pages/electrition_profile.dart';
import 'package:plumber_project/pages/user_profile.dart';
import 'package:plumber_project/pages/plumber_profile.dart';
import 'signup_screen.dart';
import 'Apis.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool remember = prefs.getBool('remember_me') ?? false;
    if (remember) {
      String? savedEmail = prefs.getString('email');
      setState(() {
        _rememberMe = true;
        _emailController.text = savedEmail ?? '';
      });
    }
  }

  Future<void> _handleLogin() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showAlert('Error', 'Please enter both email and password.');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data.containsKey('access_token')) {
        final String token = data['access_token'];
        final Map<String, dynamic> user = data['user'];
        final String role = user['role'];
        final int userId = user['id'];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        await prefs.setString('role', role);
        await prefs.setString('name', user['name']);
        await prefs.setString('email', user['email']);
        await prefs.setInt('user_id', userId);

        if (_rememberMe) {
          await prefs.setBool('remember_me', true);
        } else {
          await prefs.setBool('remember_me', false);
        }

        // ✅ Check if user has profile
        bool hasProfile = await _checkUserProfile(userId, token);

        Widget destinationPage;
        if (role == 'plumber') {
          destinationPage =
              hasProfile ? PlumberDashboard() : PlumberProfilePage();
        } else if (role == 'electrician') {
          destinationPage =
              hasProfile ? ElectricianDashboard() : ElectricianProfilePage();
        } else {
          destinationPage = hasProfile ? HomeScreen() : UserProfilePage();
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      } else {
        _showAlert('Login Error', data['message'] ?? 'Invalid credentials.');
      }
    } catch (e) {
      _showAlert('Login Error', 'Failed to connect to the server.');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // ✅ Updated function: no role checking, simple call to /check-profile/{userId}
  Future<bool> _checkUserProfile(int userId, String token) async {
    try {
      String url = 'http://10.0.2.2:8000/api/check-profile/$userId';

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['profile_exists'] == true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  void _showAlert(String title, String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Skill-Link',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28, // Increased size
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey[200],
        elevation: 0,
        centerTitle: false, // Align to the left
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 60), // reduced to compensate for AppBar
              Icon(Icons.lock, size: 80, color: Colors.black),
              SizedBox(height: 20),
              Text(
                "Email",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
              ),
              SizedBox(height: 10),
              Text(
                "Password",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              SizedBox(height: 10),
              CheckboxListTile(
                value: _rememberMe,
                onChanged: (bool? value) {
                  setState(() {
                    _rememberMe = value ?? false;
                  });
                },
                title: Text("Remember Me"),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _isLoading ? null : _handleLogin,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text(_isLoading ? "Logging in..." : "Login"),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
