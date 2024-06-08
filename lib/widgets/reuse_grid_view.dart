import 'package:flutter/material.dart';
import 'package:medical_healthcare/screens/appoinment_screen.dart';
import 'package:medical_healthcare/shared/const/assets_const.dart';
import 'package:medical_healthcare/shared/const/string_const.dart';

class ReuseGridView extends StatelessWidget {
   ReuseGridView({super.key});
  List images = [
    AssetsConst.drImages,
    AssetsConst.drImages,
    AssetsConst.drImages,
    AssetsConst.drImages,
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AppointmentScreen(),
                ));
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 4,
                      spreadRadius: 2,
                      color: Colors.black12),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 34,
                  backgroundImage:
                  AssetImage("${images[index]}"),
                ),
                const Text(
                  StringConst.doctorName,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                const Text(
                  StringConst.therapist,
                  style: TextStyle(color: Colors.black45),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(
                      StringConst.rating,
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
