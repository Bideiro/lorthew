import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lorthew/loading.dart';
import 'package:lorthew/models/cuser.dart';
import 'package:lorthew/services/auth.dart';
import 'package:lorthew/services/database.dart';
import 'package:provider/provider.dart';

import '../../models/userinf.dart';

class ProfileEditT extends StatefulWidget {
  @override
  _ProfileEditTState createState() => _ProfileEditTState();
}

class _ProfileEditTState extends State<ProfileEditT> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String fname = '';
  String lname = '';
  String abtme = '';
  String email = '';
  String phono = '';
  String loc = '';
  String subj = '';
  String pricelvl = '';
  String experience = 'Entry-Level Tutor'; // Added experience variable

  // List of options for the experience dropdown
  List<String> experienceOptions = [
    'Entry-Level Tutor',
    'Intermediate-Level Tutor',
    'Advanced-Level Tutor'
  ];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<cUser?>(context);
    return StreamBuilder<Userinfo?>(
        stream: DatabaseService(uid: user?.uid).uDatadoc,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Userinfo? userData = snapshot.data;
            String icon = userData!.iconURL;
            bool hasicon = userData.iconURL.isEmpty;
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
                      hasicon
                          ? _noUserImage(userData.fname, userData.uid!)
                          : _UserImage(icon, userData.fname, userData.uid!),
                      const SizedBox(height: 10.0),
                      //pa-wrap to stream builder, itong padding. triny ko hanggang appbar, di lumalabas sa code actions so di pwede
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
                                        initialValue: userData.fname,
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
                                        initialValue: userData.lname,
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
                                        'Subject',
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
                                        initialValue: userData.subj,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.all(12.0),
                                        ),
                                        onChanged: (val) {
                                          setState(() => subj = val);
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
                                        'Experience',
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
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.all(12.0),
                                        ),
                                        value: experience,
                                        items: experienceOptions
                                            .map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (val) {
                                          setState(() {
                                            experience = val!;
                                          });
                                        },
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
                                        'Price',
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
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.all(12.0),
                                          prefixText: '₱',
                                        ),
                                        onChanged: (val) {
                                          setState(() => pricelvl = val);
                                        },
                                        maxLength: 11,
                                        keyboardType:
                                            TextInputType.numberWithOptions(
                                                decimal: true),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*\.?\d{0,2}')),
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
                                        initialValue: userData.abtme,
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
                                        initialValue: userData.phono,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.all(12.0),
                                          prefixText: '+63 9',
                                        ),
                                        onChanged: (val) {
                                          setState(() => phono = val);
                                        },
                                        maxLength: 9,
                                        keyboardType: TextInputType.phone,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d*')),
                                          LengthLimitingTextInputFormatter(9),
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
                                        initialValue: userData.loc,
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
                                  .updateUserData(
                                      fname.isEmpty ? userData.fname : fname,
                                      lname.isEmpty ? userData.lname : lname,
                                      abtme.isEmpty ? userData.abtme : abtme,
                                      phono.isEmpty ? userData.phono : phono,
                                      loc.isEmpty ? userData.loc : loc,
                                      subj.isEmpty ? userData.subj : subj,
                                      experience.isEmpty ? userData.exp : experience);

                              print('User data updated successfully');

                              // there has an error
                              Navigator.of(context).pop();}
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

  Widget _noUserImage(String name, String uid) {
    return Stack(children: <Widget>[
      CircleAvatar(
        radius: 65.0,
        child: Text(
          name[0].toUpperCase(),
          style: const TextStyle(fontSize: 50.0),
        ),
      ),
      Positioned(
        bottom: -10,
        left: 90,
        child: IconButton(
          onPressed: () async {
            Uint8List img =
                await DatabaseService(uid: uid).updateIcon(ImageSource.gallery);
            await DatabaseService(uid: uid)
                .uploadImage('$uid - $name - Icon', img, uid);
            await DatabaseService(uid: uid)
                .updateUserData(fname, lname, abtme, phono, loc, '', '');
          },
          icon: const Icon(
            Icons.add_photo_alternate,
          ),
          iconSize: 30,
        ),
      )
    ]);
  }

  Widget _UserImage(String iconURL, String name, String uid) {
    return Stack(children: <Widget>[
      CircleAvatar(
        radius: 64,
        backgroundImage: NetworkImage(iconURL),
      ),
      Positioned(
        bottom: -10,
        left: 90,
        child: IconButton(
          onPressed: () async {
            Uint8List img =
                await DatabaseService(uid: uid).updateIcon(ImageSource.gallery);
            await DatabaseService(uid: uid)
                .uploadImage('$uid - $name - Icon', img, uid);
          },
          icon: const Icon(
            Icons.add_photo_alternate,
          ),
          iconSize: 30,
        ),
      )
    ]);
  }
}
