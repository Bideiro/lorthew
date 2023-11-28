import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment History',
          style: GoogleFonts.bebasNeue(
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(16.0),
        child: PaymentHistoryList(),
      ),
    );
  }
}

class PaymentHistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PaymentEntry(
          studentName: 'Aeron James',
          amountReceived: 500.0,
          transactionDate: '2023-02-22',
        ),
        PaymentEntry(
          studentName: 'Carlos Sainz',
          amountReceived: 750.0,
          transactionDate: '2023-09-1',
        ),
        PaymentEntry(
          studentName: 'Santa Claus',
          amountReceived: 50000.0,
          transactionDate: '2023-12-25',
        ),
      ],
    );
  }
}

class PaymentEntry extends StatelessWidget {
  final String studentName;
  final double amountReceived;
  final String transactionDate;

  PaymentEntry({
    required this.studentName,
    required this.amountReceived,
    required this.transactionDate,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        studentName,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('$transactionDate'),
      trailing: Text(
        '+ ₱${amountReceived.toString()}',
      ),
    );
  }
}