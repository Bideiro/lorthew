import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:lorthew/Screens/payment_history_t.dart';
import 'package:lorthew/Screens/payment_screen_p_3.dart';

bool isNumeric(String? str) {
  if (str == null) {
    return false;
  }
  return double.tryParse(str) != null;
}

  String generateReferenceNumber() {
    Random random = Random();
    int referenceNumber = random.nextInt(9000000) + 1000000;
    return referenceNumber.toString();
  }



class PaymentScreenP2 extends StatefulWidget {
  final String tutorName;

  const PaymentScreenP2(this.tutorName, {Key? key}) : super(key: key);

  @override
  _PaymentScreenP2State createState() => _PaymentScreenP2State();
}

class _PaymentScreenP2State extends State<PaymentScreenP2> {
  String selectedPaymentMethod = 'GCASH';
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        const CircleAvatar(
                          radius: 24,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          widget.tutorName,
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
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Client Name:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Client Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Mobile Number:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "mobile number",
                      style: TextStyle(
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
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Amount:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: amountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Enter amount',
                            ),
                          ),
                        ),
                      ],
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
                          value: selectedPaymentMethod,
                          items: const [
                            DropdownMenuItem(
                              value: 'GCASH',
                              child: Text('GCASH'),
                            ),
                            DropdownMenuItem(
                              value: 'PAYPAL',
                              child: Text('PAYPAL'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedPaymentMethod = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    AnimatedButton(
                      height: 40,
                      width: 200,
                      text: 'PAY',
                      isReverse: true,
                      selectedTextColor: Colors.black,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                      backgroundColor: const Color.fromRGBO(16, 48, 89, 1),
                      borderColor: Colors.white,
                      borderRadius: 50,
                      borderWidth: 2,
                      onPress: () {
                        String enteredAmount = amountController.text.trim();

                        if (enteredAmount.isEmpty || !isNumeric(enteredAmount)) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content: const Text('Invalid amount.'),
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
                          String referenceNumber = generateReferenceNumber();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentScreenP3(
                                amountPaid: enteredAmount,
                                referenceNumber: referenceNumber,
                                paymentTime: paymentTime,
                                paymentMethod: selectedPaymentMethod,
                                clientName: 'Client Name',
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
  }
}