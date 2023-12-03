import 'package:flutter/material.dart';
import 'package:lorthew/Screens/PaymentScreenP/payment_history_t.dart';
import 'package:lorthew/models/cuser.dart';
import 'package:lorthew/models/userinf.dart';
import 'package:provider/provider.dart';

import '../../services/database.dart';


class PaymentScreenP3 extends StatelessWidget {
  final String referenceno;
  final String paymentTime;
  final String paymentMethod;

  const PaymentScreenP3({
    required this.referenceno,
    required this.paymentTime,
    required this.paymentMethod,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<cUser?>(context);
    return StreamBuilder<Userinfo?>(
      stream: DatabaseService(uid: user?.uid).uDatadoc,
      builder: (context, snapshot) {
        Userinfo? userData = snapshot.data;
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SizedBox(
              width: 500.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 50.0,
                        ),
                        const SizedBox(height: 20.0),
                        const Text(
                          'Payment Recorded!',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        const Text(
                          'Reference Number:',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          '$referenceno',
                          style: const TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                            color: Color.fromRGBO(16, 48, 89, 1),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        const Text(
                          'Payment Time:',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          paymentTime,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        const Text(
                          'Payment Method:',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          paymentMethod,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        const Text(
                          'Client Name:',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          '${userData?.fname} ${userData?.lname}',
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentHistoryScreen(),
                              ),
                            );
                          },
                          child: const Text('View History'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}