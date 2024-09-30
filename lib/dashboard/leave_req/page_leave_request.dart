import 'package:flutter/material.dart';
import '../../component/text_style.dart';
import 'content_leave_r.dart';

class PageLeaveRequest extends StatelessWidget {
  const PageLeaveRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('background.png'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 18,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        'Leave Request',
                        style: AppTextStyles.heading1,
                      ),
                    ],
                  ),
                ),
                const ContentLeaveR()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
