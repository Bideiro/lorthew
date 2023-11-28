import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:lorthew/Screens/authentication/authenticate.dart';
import 'package:lorthew/services/auth.dart';

import '../../models/allowedDomains.dart';

class RegisterInfoPupil extends StatefulWidget {
  const RegisterInfoPupil({super.key});

  @override
  State<RegisterInfoPupil> createState() => _RegisterScreenForPupilState();
}

class _RegisterScreenForPupilState extends State<RegisterInfoPupil> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String pass = '';
  String fname = '';
  String lname = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Lorthew Registration for Pupil',
                  style: TextStyle(
                    fontFamily: 'Bebas',
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(48),
                    child: Image.asset(
                      'assets/images/Lorthew_Logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                    color: const Color(0xFFFDD835),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              const SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.grey[200],
                                ),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Email',
                                    contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                    border: InputBorder.none,
                                  ),
                                  validator: (email) {
                                    if (email == null || email.isEmpty) {
                                      return 'Enter an email address';
                                    } else if (!EmailValidator.validate(email)) {
                                      return 'Enter a valid email address';
                                    } else {
                                      String domain = email.split('@').last.toLowerCase();
                                      if (!allowedDomains.any((allowedDomain) => domain.endsWith(allowedDomain))) {
                                        return 'Enter a valid email address with an allowed domain';
                                      }
                                    }
                                    return null;
                                  },
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.grey[200],
                                ),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Password',
                                    contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                    border: InputBorder.none,
                                  ),
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Enter a password';
                                    } else if (val.length < 6) {
                                      return 'Password must be at least 6 characters long';
                                    }
                                    return null;
                                  },
                                  onChanged: (val) {
                                    setState(() => pass = val);
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.grey[200],
                                ),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'First Name',
                                    contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                    border: InputBorder.none,
                                  ),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter a first name';
                                    } else if (val.contains(RegExp(r'[0-9]'))) {
                                      return 'First name should not contain numbers';
                                    }
                                    return null;
                                  },
                                  onChanged: (val) {
                                    setState(() => fname = val);
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.grey[200],
                                ),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Last Name',
                                    contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                    border: InputBorder.none,
                                  ),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter a Last name';
                                    } else if (val.contains(RegExp(r'[0-9]'))) {
                                      return 'Last name should not contain numbers';
                                    }
                                    return null;
                                  },
                                  onChanged: (val) {
                                    setState(() => fname = val);
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              AnimatedButton(
                                height: 40,
                                width: 200,
                                text: 'REGISTER',
                                isReverse: true,
                                selectedTextColor: Colors.black,
                                transitionType: TransitionType.LEFT_TO_RIGHT,
                                backgroundColor:
                                const Color.fromRGBO(16, 48, 89, 1),
                                borderColor: Colors.white,
                                borderRadius: 50,
                                borderWidth: 2,
                                onPress: () async {
                                  if (_formKey.currentState!.validate()) {
                                    print(email + pass + lname + fname);
                                    dynamic result = await _auth.registerPupil(email, pass, fname, lname);
                                    if (result == null) {
                                      setState(() => error = 'please god');
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Authenticate(),
                                        ),
                                      );
                                    }
                                  }
                                },
                              ),
                              const SizedBox(height: 20),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Authenticate(),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                  const Color.fromRGBO(16, 48, 89, 1),
                                ),
                                child: const Text(
                                  'Already have an account? Click here to Login',
                                  style: TextStyle(fontFamily: 'Bebas'),
                                ),
                              ),

                            ],
                          )),
                    )),
              ],
            ),
          ).animate().fadeIn().scale().move(delay: 500.ms, duration: 600.ms),
        ),
      ),
    );
  }
}
