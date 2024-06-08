import 'package:flutter/material.dart';
import 'package:medical_healthcare/shared/const/color_const.dart';
import 'package:medical_healthcare/shared/const/string_const.dart';
import 'package:medical_healthcare/widgets/schedule_button_widget.dart';
import 'package:medical_healthcare/widgets/upcoming_schedule.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int buttonIndex = 0;
  final scheduleWidgets = [
    const UpcomingSchedule(),
    Container(),
    Container(),

  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                StringConst.scheduleHeader,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                color: ColorConst.reUsedWhiteColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScheduleButtonWidget(
                    text: StringConst.scheduleUpcoming,
                    onTap: () {
                      setState(() {
                        buttonIndex = 0;
                      });
                    },
                    isSelected:   buttonIndex == 0,
                  ),
                  ScheduleButtonWidget(
                    text: StringConst.scheduleCompleted,
                    onTap: () {
                      setState(() {
                        buttonIndex = 1;
                      });
                    },
                    isSelected: buttonIndex == 1,
                  ),
                  ScheduleButtonWidget(
                    text: StringConst.scheduleCanceled,
                    onTap: () {
                      setState(() {
                        buttonIndex = 2;
                      });
                    },
                    isSelected: buttonIndex == 2,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            scheduleWidgets[buttonIndex],
          ],
        ),
      ),
    );
  }
}
