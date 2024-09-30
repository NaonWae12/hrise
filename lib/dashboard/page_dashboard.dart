import 'package:flutter/material.dart';
import 'package:hrise/component/colors.dart';

import '../component/text_style.dart';
import 'content_dashboard.dart';

class PageDashboard extends StatelessWidget {
  const PageDashboard({super.key});

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
                    'Dashboard',
                    style: AppTextStyles.heading1,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.power_settings_new_rounded,
                        size: 18,
                        color: AppColors.primaryColor,
                      ),
                      Text(
                        ' Log Out',
                        style: AppTextStyles.heading5_1,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const ContentDashboard()
          ],
        ),
      ),
    );
  }
}
