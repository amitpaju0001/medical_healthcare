import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_healthcare/auth/provider/custom_auth_provider.dart';
import 'package:medical_healthcare/auth/ui/login_screen.dart';
import 'package:medical_healthcare/shared/const/assets_const.dart';
import 'package:medical_healthcare/shared/const/string_const.dart';
import 'package:medical_healthcare/widgets/reuse_list_tile.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            StringConst.settingHeader,style: TextStyle(
            fontSize: 30,fontWeight: FontWeight.w500
          ),
          ),
          const SizedBox(height: 30,),
          const ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage( AssetsConst.drImages,),
            ),
            title: Text(
              StringConst.doctorName,style: TextStyle(
              fontWeight: FontWeight.w500,fontSize: 24,
            ),
            ),
            subtitle: Text(StringConst.settingProfile),
          ),
          const Divider(height: 50,),
          ReuseListTile(
            onTap: () {},
            colors: Colors.blue.shade100,
            icon: CupertinoIcons.person,
            text: StringConst.settingProfile,
          ),
          const SizedBox(height: 20),
          ReuseListTile(
            onTap: () {},
            colors: Colors.deepPurple.shade100,
            icon: Icons.notifications_none_outlined,
            text: StringConst.settingNotifications,
          ),
          const SizedBox(height: 20),
          ReuseListTile(
            onTap: () {},
            colors: Colors.indigo.shade100,
            icon: Icons.privacy_tip_outlined,
            text: StringConst.settingPrivacy,
          ),
          const SizedBox(height: 20),
          ReuseListTile(
            onTap: () {},
            colors: Colors.green.shade100,
            icon: Icons.settings_suggest_outlined,
            text: StringConst.settingGeneral,
          ),
          const SizedBox(height: 20),
          ReuseListTile(
            onTap: () {},
            colors: Colors.orange.shade100,
            icon: Icons.info_outline_rounded,
            text: StringConst.settingAbout,
          ),
          const Divider(height: 40),
          ReuseListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Confirm Logout'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          final provider = Provider.of<CustomAuthProvider>(context, listen: false);
                          provider.logout();
                          if (!provider.isError) {
                            Navigator.of(context).pop();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                            );
                          }
                        },
                        child: const Text('Confirm'),
                      ),
                    ],
                  );
                },
              );
            },
            colors: Colors.redAccent.shade100,
            icon: Icons.logout,
            text: StringConst.settingLogOut,
          ),
        ],
      ),),
    );
  }
}
