import 'package:flutter/material.dart';

class PaymentScreenP3 extends StatelessWidget {
  const PaymentScreenP3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 500.0, // Adjust the width as needed
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
                    const Text(
                      '\u20B1 1000',
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
                    const Text(
                      '99999999999999999',
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
                    const Text(
                      'Date and Time',
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
                    const Text(
                      'GCASH',
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
                    const Text(
                      'Client Name',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    ElevatedButton(
                      onPressed: () {
                        // Add logic to download receipt
                      },
                      child: const Text('Download Receipt'),
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
