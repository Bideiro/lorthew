import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:lorthew/Screens/PaymentScreenP/payment_history_t.dart';
import 'package:lorthew/Screens/PaymentScreenP/payment_screen_p_3.dart';
import 'package:lorthew/services/database.dart';
import 'package:provider/provider.dart';

import '../../filedependencies/profilescreenpall.dart';
import '../../models/cuser.dart';

String generateReferenceNumber() {
  Random random = Random();
  int referenceNumber = random.nextInt(9000000) + 1000000;
  return referenceNumber.toString();
}

class PaymentScreenP2 extends StatefulWidget {
  final String tutorfname;
  final String tutorlname;
  final String tutoremail;
  final String tutorphono;
  final String tutoruid;
  final String iconURL;
  // final String uid;
  const PaymentScreenP2({
    super.key,required this.iconURL,
    required this.tutoruid,
    required this.tutoremail,
    required this.tutorphono,
    required this.tutorfname,
    required this.tutorlname,
  });
  @override
  State<PaymentScreenP2> createState() => _PaymentScreenP2State();
}

class _PaymentScreenP2State extends State<PaymentScreenP2> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String selectedday = 'Monday';
  String refno = '';
  String selectedPmethod = 'GCASH';
  String selectedHour = '1';
  String selectedendHour = '1';
  String selectedmin = '10';
  String selectedendmin = '10';
  String selectedperiod = 'AM';
  String selectedendperiod = 'AM';
  List<String> dayList = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  List<String> hourList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];
  List<String> minList = ['10', '20', '30', '40', '50', '60'];
  List<String> paymentMethods = ['GCASH'];
  List<String> periodList = ['AM', 'PM'];
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<cUser?>(context);
    bool hasicon = widget.iconURL.isEmpty;
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('UData')
            .doc(user.toString())
            .snapshots(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Pay Tutor',
                style: TextStyle(
                  fontFamily: 'Bebas',
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.history,
                    color: Color.fromRGBO(16, 48, 89, 1),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentHistoryScreen(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    color: Color.fromRGBO(16, 48, 89, 1),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pay To:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              hasicon
                            ? _hanosicon('${widget.tutorfname} ${widget.tutorlname}' )
                            : _hasicon(widget.iconURL),
                              const SizedBox(width: 16),
                              Text(
                                '${widget.tutorfname} ${widget.tutorlname}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Tutor Name: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${widget.tutorfname} ${widget.tutorlname}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Mobile Number:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "+63 9${widget.tutorphono}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Text(
                            'Payment Details',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Text(
                                'Payment Method:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 16),
                              DropdownButton<String>(
                                value: selectedPmethod,
                                items: paymentMethods.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedPmethod = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text(
                                'Reference Number:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: TextFormField(
                                  onChanged: (val) {
                                    setState(() => refno = val);
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter Reference Number',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Text(
                                'Time Start:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 16),
                              DropdownButton<String>(
                                value: selectedHour,
                                items: hourList.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedHour = value!;
                                  });
                                },
                              ),
                              const Text(
                                ':',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              DropdownButton<String>(
                                value: selectedmin,
                                items: minList.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedmin = value!;
                                  });
                                },
                              ),
                              DropdownButton<String>(
                                value: selectedperiod,
                                items: periodList.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedperiod = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Time end:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 16),
                              DropdownButton<String>(
                                value: selectedendHour,
                                items: hourList.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedendHour = value!;
                                  });
                                },
                              ),
                              const Text(
                                ':',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              DropdownButton<String>(
                                value: selectedendmin,
                                items: minList.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedendmin = value!;
                                  });
                                },
                              ),
                              DropdownButton<String>(
                                value: selectedendperiod,
                                items: periodList.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedendperiod = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Day of the week:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 16),
                              DropdownButton<String>(
                                value: selectedday,
                                items: dayList.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedday = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                          AnimatedButton(
                            height: 40,
                            width: 200,
                            text: 'PAY',
                            isReverse: true,
                            selectedTextColor: Colors.black,
                            transitionType: TransitionType.LEFT_TO_RIGHT,
                            backgroundColor:
                                const Color.fromRGBO(16, 48, 89, 1),
                            borderColor: Colors.white,
                            borderRadius: 50,
                            borderWidth: 2,
                            onPress: () {
                              if (refno.isEmpty) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Error'),
                                      content: const Text(
                                          'Invalid Reference Number.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                DateTime now = DateTime.now();
                                String paymentTime = now.toLocal().toString();
                                int periodints = 0;
                                int periodinte = 0;
                                if (selectedperiod == 'AM') {
                                  periodints = 0;
                                  periodinte = 0;
                                } else {
                                  periodints = 1200;
                                  periodinte = 1200;
                                }

                                int time23hstart = (int.parse(selectedmin) +
                                    (int.parse(selectedHour) * 100) +
                                    periodints);

                                int time23hend = (int.parse(selectedendmin) +
                                    (int.parse(selectedendHour) * 100) +
                                    periodinte);

                                DatabaseService().setsched(
                                    _auth.currentUser!.uid,
                                    selectedday,
                                    time23hstart,
                                    time23hend,
                                    widget.tutoruid);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PaymentScreenP3(
                                      referenceno: refno,
                                      paymentTime: paymentTime,
                                      paymentMethod: selectedPmethod,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  bool checkdb(
      DocumentSnapshot document, String day, int timeend, int timestart) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    if (data.isEmpty) {
      return true;
    } else if (day == data['day']) {
      // Displaying non-current user data
      if (int.parse(data['timestart']) > timestart &&
          int.parse(data['timeend']) <= timestart) {
        if (int.parse(data['timestart']) <= timeend &&
            int.parse(data['timeend']) > timeend) {
          return true;
        }
        return false;
      }
      return false;
    }
    return false;
  }


  Widget _hasicon(String iconURL) {
    return CircleAvatar(radius: 40.0, backgroundImage: NetworkImage(iconURL));
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
