import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:lorthew/Screens/login_screen.dart';
import 'package:lorthew/Screens/menu_screen.dart';

class RegisterInfoPupil extends StatefulWidget {
  const RegisterInfoPupil({Key? key}) : super(key: key);

  @override
  State<RegisterInfoPupil> createState() => _RegisterScreenForPupilState();
}

class _RegisterScreenForPupilState extends State<RegisterInfoPupil> {
  final List<String> items = ['Tutor', 'Pupil'];
  String? selectedValue = "Pupil";

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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(height: 30),
                        const Text(
                          'Register as a Pupil with your email and password:',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.grey[200],
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.grey[200],
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                              border: InputBorder.none,
                            ),
                            obscureText: true,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.grey[200],
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              labelText: 'First Name',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                              border: InputBorder.none,
                            ),
                            obscureText: true,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.grey[200],
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              labelText: 'Last Name',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                              border: InputBorder.none,
                            ),
                            obscureText: true,
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
                          backgroundColor: const Color.fromRGBO(16, 48, 89, 1),
                          borderColor: Colors.white,
                          borderRadius: 50,
                          borderWidth: 2,
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MenuScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
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
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn().scale().move(delay: 500.ms, duration: 600.ms),
        ),
      ),
    );
  }
}
