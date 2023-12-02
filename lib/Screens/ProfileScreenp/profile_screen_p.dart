  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
  import 'package:lorthew/Screens/ProfileScreenp/profile_edit_p.dart';
  import 'package:provider/provider.dart';

  import '../../loading.dart';
  import '../../models/cuser.dart';
  import '../../models/userinf.dart';
  import '../../services/auth.dart';
  import '../../services/database.dart';

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
                  icon: Icon(
                    Icons.logout_rounded,
                    color: Colors.black,
                    size: 24,
                  ),
                  onPressed: () async {
                    await _auth.signMeOut();
                  },
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(
                      fontFamily: 'Bebas',
                      fontSize: 30,
                      fontWeight: FontWeight.w400
                  ),
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.black,
                      size: 24,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileEditP()),
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
                        decoration: BoxDecoration(
                          color: (const Color(0xFF2196F3)),
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
                              child: Text(
                                userData!.fname[0].toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 50.0
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: Text(
                                '${userData.fname} ${userData.lname}',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
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
                                style: TextStyle(
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
                          Align(
                            alignment: AlignmentDirectional(0.00, -1.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 20),
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
                            contentPadding: EdgeInsets.symmetric(horizontal: 16),
                            leading: Icon(
                              Icons.mail_rounded,
                              color: Colors.black,
                            ),
                            title: Text(
                              'Email',
                              style: TextStyle(
                                fontFamily: 'Mukta',
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              '${userData.email}',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 16),
                            leading: Icon(
                              Icons.phone_iphone,
                              color: Colors.black,
                            ),
                            title: Text(
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
                              style: TextStyle(
                                fontFamily: 'Mukta',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 16),
                            leading: Icon(
                              Icons.location_pin,
                              color: Colors.black,
                            ),
                            title: Text(
                              'Location',
                              style: TextStyle(
                                fontFamily: 'Mukta',
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              '${userData.loc}',
                              style: TextStyle(
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
          return Loading();
        }
      });
    }
  }
