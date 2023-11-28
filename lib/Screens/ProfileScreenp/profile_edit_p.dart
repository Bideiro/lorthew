import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lorthew/services/auth.dart';
import 'package:provider/provider.dart';

import '../../loading.dart';
import '../../models/allowedDomains.dart';
import '../../models/cuser.dart';
import '../../models/userinf.dart';
import '../../services/database.dart';

class ProfileEditP extends StatefulWidget {
  @override
  _ProfileEditPState createState() => _ProfileEditPState();
}

class _ProfileEditPState extends State<ProfileEditP> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String fname = '';
  String lname = '';
  String abtme = '';
  String email = '';
  String phono = '';
  String loc = '';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<cUser?>(context);
    return StreamBuilder<pupilUserinfo?>(
        stream: DatabaseService(uid: user?.uid).PuDatadoc,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            pupilUserinfo? userData = snapshot.data;

            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                elevation: 0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: (Color(0xFFFDD835)),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontFamily: 'Bebas',
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 75.0),
                  ],
                ),
                toolbarHeight: 80.0,
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 25.0),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(44, 132, 157, 188),
                          shape: BoxShape.circle,
                          image:
                              DecorationImage(image: NetworkImage('Usericon')),
                        ),
                        child: IconButton(
                          iconSize: 100,
                          splashRadius: 1,
                          icon: const Icon(Icons.add),
                          splashColor: const Color.fromARGB(102, 255, 0, 0),
                          tooltip: "Add/Change your icon.",
                          color: Colors.black,
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        'First Name',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: Colors.grey[200],
                                      ),
                                      child: TextFormField(
                                        initialValue: userData!.fname,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.all(12.0),
                                        ),
                                        onChanged: (val) {
                                          setState(() => fname = val);
                                        },
                                        maxLength: 50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        'Last Name',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: Colors.grey[200],
                                      ),
                                      child: TextFormField(
                                        initialValue: userData!.lname,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.all(12.0),
                                        ),
                                        onChanged: (val) {
                                          setState(() => lname = val);
                                        },
                                        maxLength: 50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        'About Me',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: Colors.grey[200],
                                      ),
                                      child: TextFormField(
                                        initialValue: userData!.abtme,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.all(12.0),
                                        ),
                                        onChanged: (val) {
                                          setState(() => abtme = val);
                                        },
                                        maxLength: 160,
                                        maxLines: 5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        'Email',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: Colors.grey[200],
                                      ),
                                      child: TextFormField(
                                        initialValue: userData!.email,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.all(12.0),
                                        ),
                                        validator: (email) {
                                          if (email == null || email.isEmpty) {
                                            return 'Enter an email address';
                                          } else if (!EmailValidator.validate(
                                              email)) {
                                            return 'Enter a valid email address';
                                          } else {
                                            String domain = email
                                                .split('@')
                                                .last
                                                .toLowerCase();
                                            if (!allowedDomains.any(
                                                (allowedDomain) => domain
                                                    .endsWith(allowedDomain))) {
                                              return 'Enter a valid email address with an allowed domain';
                                            }
                                          }
                                          return null;
                                        },
                                        onChanged: (val) {
                                          setState(() => email = val);
                                        },
                                        maxLength: 50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        'Mobile Number',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: Colors.grey[200],
                                      ),
                                      child: TextFormField(
                                        initialValue: userData!.phono,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.all(12.0),
                                          prefixText: '+63 9',
                                        ),
                                        onChanged: (val) {
                                          setState(() => phono = val);
                                        },
                                        maxLength: 11,
                                        keyboardType: TextInputType.phone,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*')),
                                          LengthLimitingTextInputFormatter(11),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        'Location',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: Colors.grey[200],
                                      ),
                                      child: TextFormField(
                                        initialValue: userData!.loc,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.all(12.0),
                                        ),
                                        onChanged: (val) {
                                          setState(() => loc = val);
                                        },
                                        maxLength: 50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 50.0),
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await DatabaseService(uid: user!.uid)
                                  .updatePUserData(
                                fname.isEmpty ? userData!.fname : fname,
                                lname.isEmpty ? userData!.lname : lname,
                                abtme.isEmpty ? userData!.abtme : abtme,
                                email.isEmpty ? userData!.email : email,
                                phono.isEmpty ? userData!.phono : phono,
                                loc.isEmpty ? userData!.loc : loc,
                              );

                              print('User data updated successfully');

                              // there has an error
                              Navigator.of(context).pop();
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFFFDD835)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(LineIcons.doubleCheck,
                                    color: Colors.white),
                                SizedBox(width: 10),
                                Text(
                                  'Save',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Loading();
          }
        });
  }
}
