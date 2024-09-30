import 'package:flutter/material.dart';
import 'package:hrise/component/colors.dart';
import 'package:hrise/component/text_style.dart';

import 'leave_req/page_leave_request.dart';

class ContentDashboard extends StatelessWidget {
  const ContentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      'Leave Request',
      'Leave Request Details',
      'Leave Approval',
      'Attendance Regularization',
      'Regularization Approval',
      'Regularization Listing',
    ];

    final List<String> imagePaths = [
      'assets/calendar.png',
      'assets/detail_request.png',
      'assets/leave_approval.png',
      'assets/attendance_regulation.png',
      'assets/approval_regulation.png',
      'assets/listing_regulation.png',
    ];

    // Daftar dummy halaman tujuan
    final List<Widget> pages = [
      const PageLeaveRequest(),
      const AttendancePage(),
      const PayrollPage(),
      const NotificationsPage(),
      const ProfilePage(),
      const SettingsPage(),
    ];

    const int itemCount = 6; // Jumlah item

    return Column(
      children: [
        Wrap(
          spacing: 10, // Jarak horizontal antara item
          runSpacing: 10, // Jarak vertikal antara baris
          children: List.generate(itemCount, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pages[index]),
                );
              },
              child: Container(
                height: 149,
                width: 158,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.2), // Warna shadow dengan opacity
                      spreadRadius: 2, // Radius penyebaran shadow
                      blurRadius: 5, // Blurring shadow untuk efek lembut
                      offset: const Offset(
                          2, 3), // Offset shadow dari posisi container
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        imagePaths[index],
                        height: 64, // Sesuaikan tinggi gambar jika perlu
                      ),
                      const SizedBox(height: 10),
                      Text(
                        titles[index],
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center, // Membuat teks rata tengah
                        style: AppTextStyles.heading4,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.lock,
              color: AppColors.primaryColor,
              size: 13,
            ),
            Text(
              'DEVICE LOCK',
              style: AppTextStyles.heading5_1,
            )
          ],
        )
      ],
    );
  }
}

// dummy halaman tujuan
// class LeaveRequestPage extends StatelessWidget {
//   const LeaveRequestPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Leave Request'),
//       ),
//       body: const Center(child: Text('Leave Request Page')),
//     );
//   }
// }

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
      ),
      body: const Center(child: Text('Attendance Page')),
    );
  }
}

class PayrollPage extends StatelessWidget {
  const PayrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payroll'),
      ),
      body: const Center(child: Text('Payroll Page')),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: const Center(child: Text('Notifications Page')),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(child: Text('Profile Page')),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(child: Text('Settings Page')),
    );
  }
}
