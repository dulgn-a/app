import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Image at the top
              Container(
                child: Image.asset(
                  'assets/images/login.png',
                  width: 400,
                  height: 300,
                  alignment: Alignment.center,
                ),
              ),

              // Login title
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // Email input with icon
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email),
                ),
              ),

              // Password input with icon
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                ),
              ),
              SizedBox(height: 50.0),

              // Login button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text('Login'),
              ),
              SizedBox(height: 25.0),

              // Social login buttons
              Text('Or, login with...'),
              SizedBox(height: 25.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      icon: Image.asset('assets/images/google_icon.png'),
                      padding: EdgeInsets.symmetric(
                          horizontal: 35.0, vertical: 15.0),
                      onPressed: () {
                        // Handle Google login
                      },
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      icon: Image.asset('assets/images/facebook_icon.png'),
                      padding: EdgeInsets.symmetric(
                          horizontal: 35.0, vertical: 15.0),
                      onPressed: () {
                        // Handle Facebook login
                      },
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      icon: Image.asset('assets/images/apple_icon.png'),
                      padding: EdgeInsets.symmetric(
                          horizontal: 35.0, vertical: 15.0),
                      onPressed: () {
                        // Handle Apple login
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              // Sign up prompt
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('New to iThickLogistics? '),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/signUp');
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.blue, // Set text color to blue
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
