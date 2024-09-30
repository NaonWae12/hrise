import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'content_history.dart';

class ContentAttendance extends StatefulWidget {
  const ContentAttendance({
    super.key,
  });

  @override
  State<ContentAttendance> createState() => _ContentAttendanceState();
}

class _ContentAttendanceState extends State<ContentAttendance> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    super.initState();
    // Dummy data
    _setRangeFromDummyData();
  }

  // Fungsi untuk mengatur range berdasarkan dummy data
  void _setRangeFromDummyData() {
    DateTime now = DateTime.now();

    // Dummy 5 hari pada bulan ini (1-5)
    DateTime startOfMonthRange = DateTime(now.year, now.month, 2);
    DateTime endOfMonthRange = DateTime(now.year, now.month, 10);

    setState(() {
      _rangeStart = startOfMonthRange;
      _rangeEnd = endOfMonthRange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              onRangeSelected: (start, end, focusedDay) {
                setState(() {
                  _rangeStart = start;
                  _rangeEnd = end;
                  _focusedDay = focusedDay;
                });
              },
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              calendarStyle: const CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                rangeStartDecoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                rangeEndDecoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                rangeHighlightColor: Color.fromARGB(255, 255, 205, 210),
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
            ),
            const SizedBox(height: 15),
            const ContentHistory(),
          ],
        ),
      ),
    );
  }
}
