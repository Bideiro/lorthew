import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lorthew/loading.dart';
import 'package:lorthew/models/cuser.dart';
import 'package:lorthew/models/userinf.dart';
import 'package:lorthew/services/database.dart';
import 'package:provider/provider.dart';

import '../ChatScreen/chat_page.dart';

class TutorPage extends StatefulWidget {
  final String fname;
  final String lname;
  final String abtme;
  final String email;
  final String phono;
  final String loc;
  final String uid;
  final String iconURL;
  const TutorPage(
      {super.key,
      required this.iconURL,
      required this.fname,
      required this.lname,
      required this.abtme,
      required this.email,
      required this.phono,
      required this.loc,
      required this.uid});

  @override
  _ProfilefrommenuWidgetState createState() => _ProfilefrommenuWidgetState();
}

class _ProfilefrommenuWidgetState extends State<TutorPage> {
  double ratingBarValue = 5;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

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

    return StreamBuilder<Userinfo?>(
        stream: DatabaseService(uid: user?.uid).uDatadoc,
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            Userinfo? userData = snapshot.data;
            String hasicon = widget.iconURL;
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  title: Text(
                    '${widget.fname} ${widget.lname}',
                    style: const TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  actions: [],
                  centerTitle: false,
                  elevation: 0,
                ),
                body: Align(
                  alignment: const Alignment(0.00, 0.00),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: 140,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment(0.00, 0.00),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: hasicon.isEmpty
                                      ? _hanosicon(widget.fname)
                                      : _hasicon(widget.iconURL),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 16, 0, 12),
                        child: Text(
                          '${widget.fname} ${widget.lname}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            fontFamily: 'Outfit',
                            color: Colors.black,
                            height: 1.0,
                          ),
                        ),
                      ),
                      Text(
                        '${widget.email}',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFF716767),
                          height: 1.0,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RatingBar.builder(
                        onRatingUpdate: (newValue) =>
                            setState(() => ratingBarValue = newValue),
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: (Color(0xFFFDD835)),
                        ),
                        direction: Axis.horizontal,
                        initialRating: ratingBarValue,
                        unratedColor: (const Color(0xFF1976D2)),
                        itemCount: 5,
                        itemSize: 40,
                        glowColor: Theme.of(context).primaryColorLight,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 24, 16, 32),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                                    child: Container(
                                      width: 44,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        color: (const Color(0xFF0D47A1)),
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: Alignment(0.00, 0.00),
                                      child: Icon(
                                        Icons.work_outline,
                                        color: Theme.of(context)
                                            .primaryTextTheme
                                            .bodyText1!
                                            .color,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Subject',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                                      child: Container(
                                        width: 44,
                                        height: 44,
                                        decoration: BoxDecoration(
                                          color: (const Color(0xFF0D47A1)),
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment(0.00, 0.00),
                                        child: FaIcon(
                                          FontAwesomeIcons.solidThumbsUp,
                                          color: Theme.of(context)
                                              .primaryTextTheme
                                              .bodyText1!
                                              .color,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Experience',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                                    child: Container(
                                      width: 44,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        color: (const Color(0xFF0D47A1)),
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: Alignment(0.00, 0.00),
                                      child: Icon(
                                        Icons.attach_money_sharp,
                                        color: Theme.of(context)
                                            .primaryTextTheme
                                            .bodyText1!
                                            .color,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Price',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 400,
                          decoration: BoxDecoration(
                            color: (const Color(0xFF0D47A1)),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Color(0x33000000),
                                offset: Offset(0, -1),
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 12),
                                        child: Text(
                                          'About',
                                          style: TextStyle(
                                            fontFamily: 'Outfit',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          widget.abtme,
                                          style: TextStyle(
                                            fontFamily: 'Outfit',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 20, 0, 8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 8, 16, 8),
                                              child: Icon(
                                                Icons.phone_iphone,
                                                color: Theme.of(context)
                                                    .primaryTextTheme
                                                    .bodyText1!
                                                    .color,
                                                size: 24,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 0, 12, 0),
                                                child: Text(
                                                  'Phone Number',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    fontFamily: 'Readex Pro',
                                                    color: Theme.of(context)
                                                        .primaryTextTheme
                                                        .bodyText1!
                                                        .color,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '${widget.phono}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Readex Pro',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 8, 16, 8),
                                              child: Icon(
                                                Icons.location_pin,
                                                color: Theme.of(context)
                                                    .primaryTextTheme
                                                    .bodyText1!
                                                    .color,
                                                size: 24,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 12, 0),
                                                child: Text(
                                                  'Location',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    fontFamily: 'Readex Pro',
                                                    color: Theme.of(context)
                                                        .primaryTextTheme
                                                        .bodyLarge!
                                                        .color,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              widget.loc,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Readex Pro',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 10),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChatPage(
                                                    receiverfullname:
                                                        '${widget.fname} ${widget.lname}',
                                                    receiverUserEmail:
                                                        widget.email,
                                                    receiverUserID: widget.uid,
                                                  ),
                                                ),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary:
                                                  (const Color(0xFF4FC3F7)),
                                              elevation: 3,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              minimumSize: Size(250, 50),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.message,
                                                  size: 15,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(width: 8),
                                                Text(
                                                  'Message',
                                                  style: TextStyle(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
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
