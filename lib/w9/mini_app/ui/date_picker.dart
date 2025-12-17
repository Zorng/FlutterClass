import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final void Function(DateTime) getDate;
  const DatePicker({super.key, required this.getDate});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedDate;
  final formatter = DateFormat.yMd();

  Future<void> _selectDate() async {
    final pickDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    setState(() {
      selectedDate = pickDate;
    });
    widget.getDate(selectedDate!);
  }


  @override
  Widget build(BuildContext context) {
    print("rebuild datePicker");
    return TextButton(
      onPressed: () => _selectDate(),
      child: Row(
        children: [
          Text(
            selectedDate == null
                ? 'Pick a date'
                : formatter.format(selectedDate!),
          ),
          const SizedBox(width: 10),
          Icon(Icons.calendar_month),
        ],
      ),
    );
  }
}
