import 'package:flutter/material.dart';
import 'package:medical_healthcare/shared/const/assets_const.dart';
import 'package:medical_healthcare/shared/const/color_const.dart';
import 'package:medical_healthcare/shared/const/string_const.dart';
import 'package:medical_healthcare/widgets/chat_sample.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: ColorConst.reUsedBackgroundColor,
          leadingWidth: 30,
          title: const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(AssetsConst.drImages,),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    StringConst.doctorName,
                    style: TextStyle(
                      color:ColorConst.reUsedWhiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(top: 12, right: 10),
              child: Icon(
                Icons.call,
                color: ColorConst.reUsedWhiteColor,
                size: 26,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12, right: 10),
              child: Icon(
                Icons.video_call,
                color: ColorConst.reUsedWhiteColor,
                size: 26,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12, right: 10),
              child: Icon(
                Icons.more_vert,
                color: ColorConst.reUsedWhiteColor,
                size: 26,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 80),
        itemBuilder: (context, index) => const ChatSample(),
      ),
      bottomSheet: Container(
        height: 66,
        decoration: const BoxDecoration(color: ColorConst.reUsedWhiteColor, boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 10)
        ]),
        child: Row(
          children: [

            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(
                Icons.add,
                size: 30,
              ),
            ),const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(
                Icons.emoji_emotions_outlined,
                color: Colors.amber,
                size: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width / 1.6,
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: StringConst.messageHintText, border: InputBorder.none),
                ),
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.send,
                size: 30,
                color: ColorConst.reUsedBackgroundColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
