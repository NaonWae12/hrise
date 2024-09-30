import 'package:flutter/material.dart';
import '../component/colors.dart';
import '../component/text_style.dart';
import 'content_attendance.dart';

class PageAttendanceHistory extends StatelessWidget {
  const PageAttendanceHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('background.png'), fit: BoxFit.cover)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Attendance History',
                    style: AppTextStyles.heading1,
                  ),
                  const Icon(
                    Icons.menu,
                    size: 18,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
            const ContentAttendance(),
          ],
        ),
      ),
    );
  }
}
