import 'package:flutter/material.dart';
import 'package:medical_healthcare/shared/const/color_const.dart';
import 'package:medical_healthcare/shared/const/string_const.dart';

class ReuseRow extends StatelessWidget {
  const ReuseRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: ColorConst.reUsedBackgroundColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    spreadRadius: 4,
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      color: ColorConst.reUsedWhiteColor,
                      shape: BoxShape.circle),
                  child: const Icon(
                    Icons.add,
                    color: ColorConst.reUsedBackgroundColor,
                    size: 34,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  StringConst.clinicVisit,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: ColorConst.reUsedWhiteColor,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  StringConst.makeAppointment,
                  style: TextStyle(color: Colors.white54),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: ColorConst.reUsedWhiteColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    spreadRadius: 4,
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      color: ColorConst.reUsedWhiteColor,
                      shape: BoxShape.circle),
                  child: const Icon(
                    Icons.home_filled,
                    color: ColorConst.reUsedBackgroundColor,
                    size: 34,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  StringConst.homeVisit,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  StringConst.callDoctor,
                  style: TextStyle(color: Colors.black54),
                )
              ],
            ),
          ),
        ),
      ],
    ); ;
  }
}
