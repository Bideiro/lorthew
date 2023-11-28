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
  
  List<String> dropdownOptions1 = ['Option 1', 'Option 2', 'Option 3'];
  List<String> dropdownOptions2 = ['Choice A', 'Choice B', 'Choice C'];

  String? _selectedOption1;
  String? _selectedOption2;

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
      ),
      body: Column(
        children: <Widget>[
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
          SizedBox(height: 20),
          if (_selectedDay != null) Text('Selected Day: $_selectedDay'),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Select Option 1:'),
                  SizedBox(width: 10),
                  DropdownButton<String>(
                    hint: Text('Select Option 1'),
                    value: _selectedOption1,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedOption1 = newValue;
                      });
                    },
                    items: dropdownOptions1.map((option) {
                      return DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Select Option 2:'),
                  SizedBox(width: 10),
                  DropdownButton<String>(
                    hint: Text('Select Option 2'),
                    value: _selectedOption2,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedOption2 = newValue;
                      });
                    },
                    items: dropdownOptions2.map((option) {
                      return DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
