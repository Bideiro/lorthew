import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:email_validator/email_validator.dart';


import '../../models/allowedDomains.dart';
import '../../services/auth.dart';
import 'authenticate.dart';

class RegisterInfoTutor extends StatefulWidget {
  const RegisterInfoTutor({Key? key}) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterInfoTutor> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String pass = '';
  String fname = '';
  String lname = '';
  String error = '';

  late TextEditingController _textController1;
  late TextEditingController _textController2;
  late TextEditingController _textController3;
  late TextEditingController _textController4;
  late FocusNode _textFieldFocusNode1;
  late FocusNode _textFieldFocusNode2;
  late FocusNode _textFieldFocusNode3;
  late FocusNode _textFieldFocusNode4;
  bool _passwordVisibility = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _textController1 = TextEditingController();
    _textFieldFocusNode1 = FocusNode();

    _textController2 = TextEditingController();
    _textFieldFocusNode2 = FocusNode();

    _textController3 = TextEditingController();
    _textFieldFocusNode3 = FocusNode();

    _textController4 = TextEditingController();
    _textFieldFocusNode4 = FocusNode();
  }

  @override
  void dispose() {
    _textFieldFocusNode1.dispose();
    _textFieldFocusNode2.dispose();
    _textFieldFocusNode3.dispose();
    _textFieldFocusNode4.dispose();
    _textController1.dispose();
    _textController2.dispose();
    _textController3.dispose();
    _textController4.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        if (!_textFieldFocusNode1.hasFocus &&
            !_textFieldFocusNode2.hasFocus &&
            !_textFieldFocusNode3.hasFocus &&
            !_textFieldFocusNode4.hasFocus) {
          FocusScope.of(context).unfocus();
        } else if (!_textFieldFocusNode1.hasFocus ||
            !_textFieldFocusNode2.hasFocus ||
            !_textFieldFocusNode3.hasFocus ||
            !_textFieldFocusNode4.hasFocus) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1F4F8),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Align(
              alignment: Alignment.center,
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  Form(
                    key: _formKey,
                    child: Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 10),
                              child: Text(
                                'REGISTER as TUTOR',
                                style: TextStyle(
                                    fontFamily: 'Bebas',
                                    fontSize: 40,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Container(
                              width: 180,
                              height: 180,
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
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 10),
                              child: Text(
                                'Register with your details below',
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
                            padding: EdgeInsetsDirectional.fromSTEB(30, 16, 30, 16),
                            child: TextFormField(
                              controller: _textController1,
                              focusNode: _textFieldFocusNode1,
                              obscureText: false,
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
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: (const Color(0xFFD21919)),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: (const Color(0xFFD21919)),
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
                            padding: EdgeInsetsDirectional.fromSTEB(30, 16, 30, 16),
                            child: TextFormField(
                              controller: _textController2,
                              focusNode: _textFieldFocusNode2,
                              obscureText: !_passwordVisibility,
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
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: (const Color(0xFFD21919)),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: (const Color(0xFFD21919)),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(30, 16, 30, 16),
                            child: TextFormField(
                              controller: _textController3,
                              focusNode: _textFieldFocusNode3,
                              obscureText: false,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter your First Name';
                                } else if (val.contains(RegExp(r'[0-9]'))) {
                                  return 'First Name should not contain numbers';
                                }
                                return null;
                              },
                              onChanged: (val) {
                                setState(() => fname = val);
                              },
                              decoration: InputDecoration(
                                labelText: 'First Name',
                                labelStyle: TextStyle(
                                  fontFamily: 'Space Grotesk',
                                  color: Color(0xFF14181B),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                hintText: 'First Name',
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
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: (const Color(0xFFD21919)),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: (const Color(0xFFD21919)),
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
                            padding: EdgeInsetsDirectional.fromSTEB(30, 16, 30, 16),
                            child: TextFormField(
                              controller: _textController4,
                              focusNode: _textFieldFocusNode4,
                              obscureText: false,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter your Last name';
                                } else if (val.contains(RegExp(r'[0-9]'))) {
                                  return 'Last Name should not contain numbers';
                                }
                                return null;
                              },
                              onChanged: (val) {
                                setState(() => lname = val);
                              },
                              decoration: InputDecoration(
                                labelText: 'Last Name',
                                labelStyle: TextStyle(
                                  fontFamily: 'Space Grotesk',
                                  color: Color(0xFF14181B),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                hintText: 'Last Name',
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
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: (const Color(0xFFD21919)),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: (const Color(0xFFD21919)),
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
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(30, 16, 30, 16),
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    print(email + pass + lname + fname);
                                    dynamic result = await _auth
                                        .registerTutor(
                                        email, pass, fname, lname, '');
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
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF103059),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 55,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      fontFamily: 'Space Grotesk',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Authenticate(),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding:
                                      EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                                      child: Text(
                                        'Already have an account? Click here to login',
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
                          ),
                        ],
                      ),
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
