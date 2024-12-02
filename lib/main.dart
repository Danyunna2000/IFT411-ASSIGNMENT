import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Fixed the typo and calling runApp
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dan & Co', // Changed the app title here
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),  // The LoginPage is directly set as the home screen
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Dummy login validation (replace with actual API logic)
  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      // If the form is valid, proceed with login (show success message)
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login successful!'))); 
      // You can replace this with navigation to another screen if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dan & Co'),  // The title of the app is now Dan & Co
        backgroundColor: Colors.transparent, // Making the app bar transparent
        elevation: 0, // Removing the app bar shadow
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.computer, color: Colors.white), // Tech sticker icon
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent], // Gradient background
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Username field
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.7),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    
                    // Password field
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.7),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24),
                    
                    // Login button
                    ElevatedButton(
                      onPressed: _login,
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Colors.blueAccent, // Corrected the button color
                      ),
                    ),
                    
                    // Forgot Password link (you can add logic to handle this)
                    SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        // Handle Forgot Password (you can add your logic here)
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Forgot Password clicked')));
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
