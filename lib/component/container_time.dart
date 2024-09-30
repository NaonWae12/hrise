import 'package:flutter/material.dart';
import 'package:hrise/component/text_style.dart';

class ContainerTime extends StatelessWidget {
  final String imageAsset;
  final String timeText;
  final String labelText;

  const ContainerTime(
      {super.key,
      required this.imageAsset,
      required this.timeText,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Image.asset(
            imageAsset,
            width: 32,
            height: 36,
          ),
          Text(
            timeText,
            style: AppTextStyles.boldLabel,
          ),
          Text(
            labelText,
            style: AppTextStyles.smallLabel,
          )
        ],
      ),
    );
  }
}
