import 'package:flutter/material.dart';

class LeaveToggleButton extends StatefulWidget {
  const LeaveToggleButton({super.key});

  @override
  State<LeaveToggleButton> createState() => _LeaveToggleButtonState();
}

class _LeaveToggleButtonState extends State<LeaveToggleButton> {
  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: ToggleButtons(
        borderRadius: BorderRadius.circular(20),
        borderWidth: 0,
        selectedBorderColor: Colors.transparent,
        fillColor: Colors.red[50],
        selectedColor: Colors.red,
        color: Colors.black,
        constraints: BoxConstraints(
          minWidth: (screenWidth - 40) / 3.2,
          minHeight: 40,
        ),
        isSelected: isSelected,
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < isSelected.length; i++) {
              isSelected[i] = i == index;
            }
          });
        },
        children: [
          _buildToggleChild('Full day', 0),
          _buildToggleChild('AN', 1),
          _buildToggleChild('FN', 2),
        ],
      ),
    );
  }

  Widget _buildToggleChild(String text, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isSelected[
            index]) // Menampilkan icon hanya pada tombol yang dipilih
          const Icon(Icons.check, color: Colors.red),
        if (isSelected[index]) const SizedBox(width: 5),
        Text(
          text,
          style: isSelected[index] ? const TextStyle(color: Colors.red) : null,
        ),
      ],
    );
  }
}
