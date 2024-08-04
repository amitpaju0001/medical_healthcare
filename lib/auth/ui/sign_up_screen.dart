import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medical_healthcare/auth/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:medical_healthcare/auth/provider/custom_auth_provider.dart';
import 'package:medical_healthcare/auth/ui/login_screen.dart';
import 'package:medical_healthcare/shared/const/assets_const.dart';
import 'package:medical_healthcare/shared/const/color_const.dart';
import 'package:medical_healthcare/shared/const/string_const.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passToggle = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorConst.reUsedWhiteColor,
      child: Consumer<CustomAuthProvider>(builder: (context, provider, child) {
        return SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    AssetsConst.drImages,
                    height: 288,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: StringConst.signUpName,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: StringConst.signUpEmail,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      labelText: StringConst.signUpPhone,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: TextField(
                    controller: passwordController,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                      labelText: StringConst.signUpPassword,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: passToggle
                            ? const Icon(CupertinoIcons.eye_slash_fill)
                            : const Icon(CupertinoIcons.eye_fill),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: TextField(
                    controller: confirmPasswordController,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                      labelText: StringConst.signUpConfirmPassword,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: passToggle
                            ? const Icon(CupertinoIcons.eye_slash_fill)
                            : const Icon(CupertinoIcons.eye_fill),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Material(
                      color: ColorConst.reUsedBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () async {
                          if (passwordController.text != confirmPasswordController.text) {
                            Fluttertoast.showToast(
                              msg: 'Password does not match with confirm password',
                            );
                          } else {
                            UserModel userModel = UserModel(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                            CustomAuthProvider provider = Provider.of<CustomAuthProvider>(context, listen: false);
                            await provider.createAccount(userModel);
                            if (!provider.isError) {
                              Navigator.pop(context);
                            }
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                          child: Center(
                            child: Text(
                              StringConst.signUp,
                              style: TextStyle(
                                color: ColorConst.reUsedWhiteColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      StringConst.signUpAlreadyAccount,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        StringConst.signUpLogin,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorConst.reUsedBackgroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
