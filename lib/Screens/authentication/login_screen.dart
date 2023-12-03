import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lorthew/Screens/authentication/register_info_p.dart';
import 'package:lorthew/Screens/authentication/register_info_t.dart';

import '../../services/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String pass = '';
  String error = '';

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;
  bool _passwordVisibility = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        if (_emailFocusNode.canRequestFocus || _passwordFocusNode.canRequestFocus) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1F4F8),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  Align(
                    alignment: Alignment(0.0, 0.0),
                    child: Container(
                      width: 250,
                      height: 250,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/Lorthew_Logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Lorthew',
                        style: TextStyle(
                            fontFamily: 'Bebas',
                            fontSize: 40,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Login with your email and password',
                        style: TextStyle(
                          fontFamily: 'Space Grotesk',
                          color: Color(0xFF57636C),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 16, 30, 16),
                    child: TextFormField(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      obscureText: false,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontFamily: 'Space Grotesk',
                          color: Color(0xFF14181B),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          fontFamily: 'Space Grotesk',
                          color: Color(0xFF14181B),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF14181B),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: (const Color(0xFF1976D2)),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        color: Color(0xFF14181B),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 16, 30, 16),
                    child: TextFormField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      obscureText: !_passwordVisibility,
                      onChanged: (val) {
                        setState(() => pass = val);
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontFamily: 'Space Grotesk',
                          color: Color(0xFF14181B),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontFamily: 'Space Grotesk',
                          color: Color(0xFF14181B),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF14181B),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: (const Color(0xFF1976D2)),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              _passwordVisibility = !_passwordVisibility;
                            });
                          },
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            _passwordVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color(0xFF57636C),
                            size: 22,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        color: Color(0xFF14181B),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                        child: InkWell(
                          onTap: () async {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 16, 30, 16),
                          child: ElevatedButton(
                            onPressed: () async {
                              print('hello');
                              if (_formKey.currentState!.validate()) {
                                dynamic result = _auth.signIn(email, pass);
                                if (result == null) {
                                  setState(() => error = 'wrong');
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF103059),
                              textStyle: const TextStyle(
                                fontFamily: 'Space Grotesk',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: const Text('Login',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const RegisterInfoPupil(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text(
                              'Don\'t have an account? Click here to register as a student',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Space Grotesk',
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const RegisterInfoTutor(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text(
                              'Click here to register as a tutor',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Space Grotesk',
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
