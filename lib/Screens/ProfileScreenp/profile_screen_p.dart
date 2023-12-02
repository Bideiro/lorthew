import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../loading.dart';
import '../../models/cuser.dart';
import '../../models/userinf.dart';
import '../../services/auth.dart';
import '../../services/database.dart';
import '../all.dart';

class ProfileScreenP extends StatelessWidget {
  final AuthService _auth = AuthService();

  ProfileScreenP({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<cUser?>(context);

    if (Theme.of(context).platform == TargetPlatform.iOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    // print("Building Profile Page with User Data: $userData");
    return StreamBuilder<PupilUserinfo?>(
        stream: DatabaseService(uid: user?.uid).PuDatadoc,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            PupilUserinfo? userData = snapshot.data;
            bool hasicon = userData!.iconURL.isEmpty;
            return GestureDetector(
              onTap: () {
                if (FocusScope.of(context).hasFocus) {
                  FocusScope.of(context).unfocus();
                }
              },
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: (const Color(0xFF2196F3)),
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                    icon: const Icon(
                      Icons.logout_rounded,
                      color: Colors.black,
                      size: 24,
                    ),
                    onPressed: () async {
                      await _auth.signMeOut();
                    },
                  ),
                  title: const Text(
                    'Profile',
                    style: TextStyle(
                        fontFamily: 'Bebas',
                        fontSize: 30,
                        fontWeight: FontWeight.w400),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: 24,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileEditP()),
                        );
                      },
                    ),
                  ],
                  centerTitle: false,
                  elevation: 0,
                ),
                body: SafeArea(
                  top: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: (Color(0xFF2196F3)),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 65.0,
                                child: hasicon
                                    ? _hanosicon(userData.fname)
                                    : _hasicon(userData.iconURL),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 0),
                                child: Text(
                                  '${userData.fname} ${userData.lname}',
                                  style: const TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Text(
                                  'About Me',
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  userData.abtme,
                                  style: const TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Align(
                              alignment: AlignmentDirectional(0.00, -1.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 25, 0, 20),
                                child: Text(
                                  'Contact Information',
                                  style: TextStyle(
                                    fontFamily: 'Mukta',
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              leading: const Icon(
                                Icons.mail_rounded,
                                color: Colors.black,
                              ),
                              title: const Text(
                                'Email',
                                style: TextStyle(
                                  fontFamily: 'Mukta',
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                userData.email,
                                style: const TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              leading: const Icon(
                                Icons.phone_iphone,
                                color: Colors.black,
                              ),
                              title: const Text(
                                'Phone',
                                style: TextStyle(
                                  fontFamily: 'Mukta',
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                '+63 9${userData.phono}',
                                style: const TextStyle(
                                  fontFamily: 'Mukta',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              leading: const Icon(
                                Icons.location_pin,
                                color: Colors.black,
                              ),
                              title: const Text(
                                'Location',
                                style: TextStyle(
                                  fontFamily: 'Mukta',
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                userData.loc,
                                style: const TextStyle(
                                  fontFamily: 'Mukta',
                                  color: Colors.black,
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
            );
          } else {
            return const Loading();
          }
        });
  }

  Widget _hasicon(String iconURL) {
    return CircleAvatar(radius: 65.0, backgroundImage: NetworkImage(iconURL));
  }

  Widget _hanosicon(String name) {
    return CircleAvatar(
        radius: 65.0,
        child: Text(
          name[0].toUpperCase(),
          style: const TextStyle(fontSize: 50.0),
        ));
  }
}
