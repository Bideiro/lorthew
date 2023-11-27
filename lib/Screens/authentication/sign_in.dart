import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';



class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final List<String> items = ['Tutor', 'Pupil'];
    String? selectedValue = "Pupil";

    void handleAvatarTap(int avatarIndex) {
      print('Avatar $avatarIndex clicked'); //testing
    }

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
                  'Lorthew',
                  style: TextStyle(
                      fontFamily: 'Bebas',
                      fontSize: 40,
                      fontWeight: FontWeight.w400),
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
                  color: (const Color(0xFFFDD835)),
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
                          'Login with your email and password:',
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
                        const SizedBox(height: 20),
                        AnimatedButton(
                          height: 40,
                          width: 200,
                          text: 'LOGIN',
                          isReverse: true,
                          selectedTextColor: Colors.black,
                          transitionType: TransitionType.LEFT_TO_RIGHT,
                          backgroundColor: const Color.fromRGBO(16, 48, 89, 1),
                          borderColor: Colors.white,
                          borderRadius: 50,
                          borderWidth: 2,
                          onPress: () async{
                            dynamic result = await _auth.signIn();
                            if (result) {
                              print("no sign");
                              print(result.uid);
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor:
                                const Color.fromRGBO(16, 48, 89, 1),
                          ),
                          child: const Text(
                            "Don't have an account? Click here to Register",
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
