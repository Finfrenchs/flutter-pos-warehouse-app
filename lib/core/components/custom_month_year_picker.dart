import 'package:flutter/material.dart';
import 'package:mat_month_picker_dialog/mat_month_picker_dialog.dart';

import '../core.dart';

class CustomMonthYearPicker extends StatefulWidget {
  final void Function(DateTime selectedMonth)? onMonthSelected;
  final DateTime? initialMonth;
  final Widget? prefix;
  final String label;
  final bool showLabel;
  final String? hintText;
  final double borderRadius;

  const CustomMonthYearPicker({
    super.key,
    required this.label,
    this.showLabel = true,
    this.initialMonth,
    this.onMonthSelected,
    this.prefix,
    this.hintText,
    this.borderRadius = 18.0,
  });

  @override
  State<CustomMonthYearPicker> createState() => _CustomMonthYearPickerState();
}

class _CustomMonthYearPickerState extends State<CustomMonthYearPicker> {
  late TextEditingController controller;
  late DateTime selectedMonth;

  @override
  void initState() {
    controller = TextEditingController(
      text: widget.initialMonth?.month.toString(),
    );
    selectedMonth = widget.initialMonth ?? DateTime.now();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _selectMonth(BuildContext context) async {
    final DateTime? picked = await showMonthPicker(
      context: context,
      initialDate: selectedMonth,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedMonth) {
      setState(() {
        selectedMonth = picked;
        controller.text = selectedMonth.getMonthYearName();
      });
      if (widget.onMonthSelected != null) {
        widget.onMonthSelected!(picked);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showLabel) ...[
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12.0),
        ],
        TextFormField(
          controller: controller,
          onTap: () => _selectMonth(context),
          readOnly: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(color: AppColors.stroke),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(color: AppColors.stroke),
            ),
            suffixIcon: const Icon(Icons.calendar_today),
            hintText: widget.initialMonth != null
                ? selectedMonth.month.toString()
                : widget.hintText ?? widget.label,
          ),
        ),
      ],
    );
  }
}
