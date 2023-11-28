import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleEditT extends StatefulWidget {
  @override
  _ScheduleEditTState createState() => _ScheduleEditTState();
}

class _ScheduleEditTState extends State<ScheduleEditT> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pay Tutor',
          style: TextStyle(
              fontFamily: 'Bebas', fontSize: 30, fontWeight: FontWeight.w400),
        ),
      ),
      body: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
            ),
            if (_selectedDay != null) Text('Selected Day: $_selectedDay'),
          ],
        ),
      );
  }
}
