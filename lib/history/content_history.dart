import 'package:flutter/material.dart';
import 'package:hrise/component/text_style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContentHistory extends StatefulWidget {
  const ContentHistory({super.key});

  @override
  _ContentHistoryState createState() => _ContentHistoryState();
}

class _ContentHistoryState extends State<ContentHistory> {
  // Data attendance
  String checkIn = '';
  String checkOut = '';
  String totalHours = '';

  @override
  void initState() {
    super.initState();
    fetchAttendanceData();
  }

  // Function to fetch attendance data from API
  Future<void> fetchAttendanceData() async {
    final url =
        Uri.parse('https://hr.simise.id/api/hr.attendance/search?domain=[]');
    try {
      final response = await http.get(
        url,
        headers: {
          'api-key': 'H2BSQUDSOEJXRLT0P2W1GLI9BSYGCQ08',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          checkIn = data['check_in'] ?? 'N/A';
          checkOut = data['check_out'] ?? 'N/A';
          totalHours = data['total_hours'] ?? 'N/A';
        });
      } else {
        // Handle error
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 53,
                width: 53,
                decoration: BoxDecoration(
                    color: const Color(0xFF6FAB55),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('06', style: AppTextStyles.heading1_1),
                    Text('TUE', style: AppTextStyles.smallLabel_1)
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    checkIn,
                    style: AppTextStyles.boldLabel,
                  ),
                  Text(
                    'Check In',
                    style: AppTextStyles.smallLabel,
                  )
                ],
              ),
              Column(
                children: [
                  Text(checkOut, style: AppTextStyles.boldLabel),
                  Text('Check Out', style: AppTextStyles.smallLabel)
                ],
              ),
              Column(
                children: [
                  Text(totalHours, style: AppTextStyles.boldLabel),
                  Text('Total Hours', style: AppTextStyles.smallLabel)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
