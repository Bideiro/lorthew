import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/userinf.dart';

class dynamicprofilescreenp extends StatefulWidget {
  const dynamicprofilescreenp({super.key});

  @override
  State<dynamicprofilescreenp> createState() => _dynamicprofilescreenpState();
}

class _dynamicprofilescreenpState extends State<dynamicprofilescreenp> {
  @override
  Widget build(BuildContext context) {
    final uData = Provider.of<List<pupilUserinfo>?>(context);

    uData?.forEach((pupilUserinfo) {
      print(pupilUserinfo.fname);
      print(pupilUserinfo.lname);
      print(pupilUserinfo.email);
    });
    return  Container();
  }
}
