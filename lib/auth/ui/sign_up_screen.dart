import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:medical_healthcare/auth/model/user_model.dart';
import 'package:medical_healthcare/auth/provider/custom_auth_provider.dart';
import 'package:medical_healthcare/auth/ui/login_screen.dart';
import 'package:medical_healthcare/auth/ui/otp_screen.dart';
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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
            child: Form(
              key: formKey,
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
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        isCollapsed: true,
                        labelText: StringConst.signUpName,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        isCollapsed: true,
                        labelText: StringConst.signUpEmail,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                    child: TextFormField(

                      controller: phoneController,
                      decoration: const InputDecoration(isCollapsed: true,
                        labelText: StringConst.signUpPhone,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: passToggle,
                      decoration: InputDecoration(isCollapsed: true,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: TextFormField(
                      controller: confirmPasswordController,
                      obscureText: passToggle,
                      decoration: InputDecoration(isCollapsed: true,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (passwordController.text != value) {
                          return 'Password does not match';
                        }
                        return null;
                      },
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
                            if (formKey.currentState?.validate() ?? false) {
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
                                await provider.verifyPhoneNumber(phoneController.text);
                                if (provider.verificationId != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OtpScreen(
                                        verificationId: provider.verificationId!,
                                      ),
                                    ),
                                  );
                                } else {
                                  Fluttertoast.showToast(msg: 'Failed to send OTP');
                                }
                              }
                            } else {
                              Fluttertoast.showToast(msg: 'Please fill all fields');
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
          ),
        );
      }),
    );
  }
}
