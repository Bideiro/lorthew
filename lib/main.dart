import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lorthew/Screens/authentication/authenticate.dart';
import 'package:lorthew/models/cuser.dart';
import 'package:lorthew/services/auth.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    StreamProvider<cUser?>.value(
      catchError: (_,__) {},
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Authenticate(),
      ),
    ),
  );
}
