import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ylearning/pages/sign_in/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                color: Colors.grey.withOpacity(0.6),
                height: 1.0,
              )),
          title: Text(
            "Sign In",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildThirdPartyLogin(context),
              Center(child: reusableText("Or use your email account to login")),
              Container(
                margin: EdgeInsets.only(top: 60.h),
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Column(
                  children: [
                    reusableText("Email"),
                    SizedBox(
                      height: 5.h,
                    ),
                    buildTextField("Enter your email adress", "email", "lock"),
                    SizedBox(
                      height: 5.h,
                    ),
                    reusableText("Password"),
                    buildTextField("Enter your password", "password", "user"),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
