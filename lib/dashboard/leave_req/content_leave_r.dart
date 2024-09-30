import 'package:flutter/material.dart';
import 'package:hrise/component/colors.dart';
import 'package:hrise/component/text_style.dart';
import 'package:hrise/component/textfield_input.dart';

import 'date_picker_field.dart';
import 'leave_toggle_button.dart';
import 'selection_button.dart';

class ContentLeaveR extends StatefulWidget {
  const ContentLeaveR({super.key});

  @override
  State<ContentLeaveR> createState() => _ContentLeaveRState();
}

class _ContentLeaveRState extends State<ContentLeaveR> {
  DateTime? _fromDate;
  DateTime? _toDate;
  List<bool> isSelected = [true, false, false];

  Future<void> selectDate(BuildContext context, DateTime? initialDate,
      ValueChanged<DateTime?> onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Time Off Type',
              style: AppTextStyles.heading3,
            ),
          ),
          const SizedBox(height: 15),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'Select Leave Type',
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            items: const [
              DropdownMenuItem(
                value: 'Sick Leave',
                child: Text('Sick Leave'),
              ),
              DropdownMenuItem(
                value: 'Casual Leave',
                child: Text('Casual Leave'),
              ),
              DropdownMenuItem(
                value: 'Annual Leave',
                child: Text('Annual Leave'),
              ),
            ],
            onChanged: (value) {},
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DatePickerField(
                  label: 'From date',
                  selectedDate: _fromDate,
                  onDateSelected: (newDate) {
                    setState(() {
                      _fromDate = newDate;
                    });
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DatePickerField(
                  label: 'To date',
                  selectedDate: _toDate,
                  onDateSelected: (newDate) {
                    setState(() {
                      _toDate = newDate;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const TextfieldInput(hintText: 'Duration'),
          const SizedBox(height: 15),
          const LeaveToggleButton(),
          const SizedBox(height: 15),
          const TextfieldInput(hintText: 'Reason for leave'),
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Is it a Comp Off?',
              style: AppTextStyles.heading3,
            ),
          ),
          const SizedBox(height: 15),
          const SelectionButton(),
          const SizedBox(height: 15),
          const TextfieldInput(
            hintText: 'Employee Code',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 15),
          const TextfieldInput(hintText: 'Employee Name'),
          const SizedBox(height: 15),
          const TextfieldInput(
            hintText: "Applicant's phone Number",
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 15),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'Submit',
                  style: AppTextStyles.heading1_1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
