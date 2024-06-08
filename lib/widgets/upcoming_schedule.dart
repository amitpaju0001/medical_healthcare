import 'package:flutter/material.dart';
import 'package:medical_healthcare/shared/const/assets_const.dart';
import 'package:medical_healthcare/shared/const/color_const.dart';
import 'package:medical_healthcare/shared/const/string_const.dart';

class UpcomingSchedule extends StatefulWidget {
  const UpcomingSchedule({super.key});

  @override
  State<UpcomingSchedule> createState() => _UpcomingScheduleState();
}

class _UpcomingScheduleState extends State<UpcomingSchedule> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(StringConst.aboutDoctor,style: TextStyle(
          fontWeight: FontWeight.w500,fontSize: 18
        ),),
        const SizedBox(height: 16,),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: ColorConst.reUsedWhiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 2,
                blurRadius: 4,
              ),
            ]
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const ListTile(
                  title: Text(StringConst.doctorName,style: TextStyle(
                    fontWeight: FontWeight.w500
                  ),),
                  subtitle: Text(
                    StringConst.therapist,
                  ),
                  trailing: CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage( AssetsConst.drImages,),
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  thickness: 1,
                  height: 20,
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   const Row(
                     children: [
                           Icon(Icons.calendar_month,color: Colors.black54,),
                           SizedBox(width: 4,),
                           Text(StringConst.upcomingCalender,style: TextStyle(
                               color: Colors.black54
                           ),),
                     ],
                   ),
                   const Row(
                     children: [
                       Icon(Icons.access_time_filled,color: Colors.black54,),
                       SizedBox(width: 4,),
                       Text(StringConst.upcomingTime,style: TextStyle(
                           color: Colors.black54
                       ),)
                     ],
                   ),
                   Row(
                     children: [
                       Container(
                         padding: const EdgeInsets.all(4),
                         decoration: const BoxDecoration(
                           color: Colors.green,
                           shape: BoxShape.circle
                         ),
                       ),
                       const SizedBox(
                         width: 4,
                       ),
                       const Text(
                         StringConst.upcomingConfirm,
                         style: TextStyle(
                           color: Colors.black54,
                         ),
                       )
                     ],
                   )
                 ],
                ),
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                      },
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: ColorConst.reUsedWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            StringConst.upcomingCancel,style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,color: Colors.black54,
                          ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                      },
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xff7165d6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            StringConst.upcomingReschedule,style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,color: ColorConst.reUsedWhiteColor
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,)
              ],
            ),
          ),
        ),
        const SizedBox(height: 10,),
        const Text(StringConst.aboutDoctor,style: TextStyle(
            fontWeight: FontWeight.w500,fontSize: 18
        ),),
        const SizedBox(height: 16,),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
              color: ColorConst.reUsedWhiteColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 4,
                ),
              ]
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const ListTile(
                  title: Text(StringConst.doctorName,style: TextStyle(
                      fontWeight: FontWeight.w500
                  ),),
                  subtitle: Text(
                    StringConst.therapist,
                  ),
                  trailing: CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage( AssetsConst.drImages,),
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(
                    thickness: 1,
                    height: 20,
                  ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.calendar_month,color: Colors.black54,),
                        SizedBox(width: 4,),
                        Text(StringConst.upcomingCalender,style: TextStyle(
                            color: Colors.black54
                        ),),
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(Icons.access_time_filled,color: Colors.black54,),
                        SizedBox(width: 4,),
                        Text(StringConst.upcomingTime,style: TextStyle(
                            color: Colors.black54
                        ),)
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
                          StringConst.upcomingTime,
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                      },
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: ColorConst.reUsedWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            StringConst.upcomingCancel,style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,color: Colors.black54,
                          ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                      },
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xff7165d6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            StringConst.upcomingReschedule,style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,color: ColorConst.reUsedWhiteColor
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,)
              ],
            ),
          ),
        ),
        const SizedBox(height: 10,),
        const Text(StringConst.aboutDoctor,style: TextStyle(
            fontWeight: FontWeight.w500,fontSize: 18
        ),),
        const SizedBox(height: 16,),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
              color: ColorConst.reUsedWhiteColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 4,
                ),
              ]
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const ListTile(
                  title: Text(StringConst.doctorName,style: TextStyle(
                      fontWeight: FontWeight.w500
                  ),),
                  subtitle: Text(
                    StringConst.therapist,
                  ),
                  trailing: CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage( AssetsConst.drImages,),
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(
                    thickness: 1,
                    height: 20,
                  ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.calendar_month,color: Colors.black54,),
                        SizedBox(width: 4,),
                        Text(StringConst.upcomingCalender,style: TextStyle(
                            color: Colors.black54
                        ),),
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(Icons.access_time_filled,color: Colors.black54,),
                        SizedBox(width: 4,),
                        Text(StringConst.upcomingTime,style: TextStyle(
                            color: Colors.black54
                        ),)
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
                          StringConst.upcomingConfirm,
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                      },
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: ColorConst.reUsedWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            StringConst.upcomingCancel,style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,color: Colors.black54,
                          ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                      },
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color:ColorConst.reUsedBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            StringConst.upcomingReschedule,style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,color: ColorConst.reUsedWhiteColor,
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ],
    ),);
  }
}
