import 'package:flutter/material.dart';
import 'package:medical_healthcare/shared/const/color_const.dart';
import 'package:medical_healthcare/shared/const/string_const.dart';

class ScheduleButtonWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  const ScheduleButtonWidget({
    required this.text,
    required this.isSelected,required this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
        const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: isSelected ? ColorConst.reUsedBackgroundColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? ColorConst.reUsedWhiteColor : Colors.black38,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
