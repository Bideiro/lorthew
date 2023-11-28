import 'package:flutter/material.dart';
import 'package:lorthew/Screens/PaymentScreenP/payment_history_t.dart';

class PaymentScreenP3 extends StatelessWidget {
  final String amountPaid;
  final String referenceNumber;
  final String paymentTime;
  final String paymentMethod;
  final String clientName;

  const PaymentScreenP3({
    required this.amountPaid,
    required this.referenceNumber,
    required this.paymentTime,
    required this.paymentMethod,
    required this.clientName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      'Payment Success!',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    const Text(
                      'Amount Paid:',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      '₱$amountPaid',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Bebas',
                        color: Color.fromRGBO(16, 48, 89, 1),
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
                      referenceNumber,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
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
                      style: TextStyle(
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
                      style: TextStyle(
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
                      clientName,
                      style: TextStyle(
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
}