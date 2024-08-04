import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_healthcare/auth/model/user_model.dart';
import 'package:medical_healthcare/auth/ui/forgot_password_screen.dart';
import 'package:medical_healthcare/widgets/navbar_roots.dart';
import 'package:provider/provider.dart';
import 'package:medical_healthcare/auth/provider/custom_auth_provider.dart';
import 'package:medical_healthcare/auth/ui/sign_up_screen.dart';
import 'package:medical_healthcare/shared/const/assets_const.dart';
import 'package:medical_healthcare/shared/const/color_const.dart';
import 'package:medical_healthcare/shared/const/string_const.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passToggle = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  child: Image.asset(AssetsConst.drImages),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text(StringConst.usernameLabelText),
                        prefixIcon: Icon(Icons.person)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    controller: passwordController,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        label: const Text(StringConst.passwordLabelText),
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
                        )),
                  ),
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
                          UserModel userModel = UserModel(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim());
                          CustomAuthProvider provider = Provider.of<CustomAuthProvider>(context, listen: false);
                          await provider.login(userModel);
                          if (!provider.isError) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NavBarRoots(),
                              ),
                            );
                          }
                        },
                        child: const Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                          child: Center(
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                  color: ColorConst.reUsedWhiteColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  child: Center(
                    child: GestureDetector(
                      onTap: ()async {
                        CustomAuthProvider provider = Provider.of(context,listen: false);
                        await provider.googleLogin();
                        if(!provider.isError){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const NavBarRoots(),));
                        }
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.google,size: 20,),
                          SizedBox(width: 5,),
                          Text('Google Login',style: TextStyle(
                            fontSize: 18,color: Colors.blue,fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ForgotPasswordScreen();
                  },));
                }, child: const Text(
                    'Forgot Password ?'
                )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      StringConst.noAccount,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ));
                      },
                      child: const Text(
                        StringConst.createAccount,
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
