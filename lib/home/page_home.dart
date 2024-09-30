import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hrise/component/text_style.dart';
import 'package:intl/intl.dart';
import '../component/container_time.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  late String currentTime;
  late String currentDate;
  bool isClicked = false; // Untuk mendeteksi apakah tombol diklik
  double progress = 0.0; // Nilai progress dalam rentang 0.0 - 1.0
  Timer? timer; // Timer untuk kontrol progress

  @override
  void initState() {
    super.initState();
    _updateTimeAndDate();
  }

  void _updateTimeAndDate() {
    final now = DateTime.now();
    currentTime = DateFormat('hh:mm a').format(now);
    currentDate = DateFormat('MMM dd, yyyy - EEEE').format(now);
  }

  // Fungsi untuk mulai atau menghentikan timer
  void _startOrStopProgress() {
    if (isClicked) {
      // Jika tombol sudah diklik, maka reset
      timer?.cancel();
      setState(() {
        progress = 0.0;
        isClicked = false;
      });
    } else {
      // Memulai timer untuk progress selama 60 detik
      timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
        setState(() {
          progress += 0.00167; // Increment 0.00167 (1/60 detik)

          // if (progress >= 1.0) {
          //   timer.cancel(); // Hentikan timer ketika progress mencapai 100%
          //   progress = 1.0;
          // }
        });
      });

      setState(() {
        isClicked = true;
      });
    }
  }

  // Mendapatkan warna berdasarkan persentase progress
  Color _getProgressColor(double progress) {
    if (progress <= 0.35) {
      return Colors.red;
    } else if (progress <= 0.70) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('background.png'), fit: BoxFit.cover)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.account_circle,
                      size: 45,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'HEY JHONE DOE',
                          style: AppTextStyles.heading1,
                        ),
                        Text(
                          'MZ001234',
                          style: AppTextStyles.heading5,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Text(currentTime, style: AppTextStyles.displayText),
                Text(currentDate, style: AppTextStyles.heading4),
                const SizedBox(height: 50),

                // GestureDetector untuk mendeteksi klik
                GestureDetector(
                  onTap:
                      _startOrStopProgress, // Memanggil fungsi mulai atau hentikan progress
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Gambar background
                      Image.asset(
                        'assets/button_check.png',
                        width: 227,
                        height: 227,
                      ),
                      SizedBox(
                        width: 227,
                        height: 227,
                        child: CircularProgressIndicator(
                          value: progress, // Nilai progres
                          strokeWidth: 6,
                          color: _getProgressColor(
                              progress), // Ubah warna berdasarkan progress
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ContainerTime(
                        imageAsset: 'assets/time_in.png',
                        timeText: '09:08 AM',
                        labelText: 'Check In'),
                    ContainerTime(
                        imageAsset: 'assets/time_out.png',
                        timeText: '09:08 AM',
                        labelText: 'Check Out'),
                    ContainerTime(
                        imageAsset: 'assets/total_time.png',
                        timeText: '09:08 AM',
                        labelText: 'Total Hours'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel(); // Pastikan timer berhenti ketika widget dihapus
    super.dispose();
  }
}
