import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:medical_healthcare/shared/const/color_const.dart';
import 'package:medical_healthcare/shared/const/string_const.dart';

class ChatSample extends StatefulWidget {
  const ChatSample({super.key});

  @override
  State<ChatSample> createState() => _ChatSampleState();
}

class _ChatSampleState extends State<ChatSample> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.only(right: 80),
        child: ClipPath(
          clipper: UpperNipMessageClipper(MessageType.receive),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: ColorConst.reUsedWhiteColor
            ),
            child: const Text(StringConst.chatSample,
            style: TextStyle(
              fontSize: 16,
            ),),
          ),
        ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 20,left: 80),
            child: ClipPath(
              clipper: LowerNipMessageClipper(MessageType.send),
              child: Container(
                padding: const EdgeInsets.only(left: 20,top: 10,bottom: 24,right: 20),
                decoration: const BoxDecoration(
                  color: ColorConst.reUsedBackgroundColor,
                ),
                child: const Text(
                StringConst.chatText ,style: TextStyle(
                  fontSize: 16,color: ColorConst.reUsedWhiteColor,
                ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
