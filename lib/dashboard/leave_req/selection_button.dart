import 'package:flutter/material.dart';

class SelectionButton extends StatefulWidget {
  const SelectionButton({super.key});

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
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
          constraints: const BoxConstraints(
            minWidth: 120,
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
            _buildToggleChild('No', 0),
            _buildToggleChild('Yes', 1),
          ],
        ),
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
