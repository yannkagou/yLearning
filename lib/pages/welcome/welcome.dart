import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ylearning/main.dart';
import 'package:ylearning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ylearning/pages/welcome/bloc/welcome_events.dart';
import 'package:ylearning/pages/welcome/bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context)
                          .add(WelccomeEvent());
                    },
                    children: [
                      _page(
                          1,
                          context,
                          "Next",
                          "First See Learning",
                          "Forget about a for of paper all knowledge in one learning",
                          "assets/images/reading.png"),
                      _page(
                          2,
                          context,
                          "Next",
                          "Connect With Everyone",
                          "Always keep in touch with your tutor & friends, let's get connected",
                          "assets/images/boy.png"),
                      _page(
                          3,
                          context,
                          "Get Started",
                          "Always Fascinated Learning",
                          "Anywhere, anytime. The time is at your discretion so study whenever you want",
                          "assets/images/man.png"),
                    ],
                  ),
                  Positioned(
                      bottom: 100.h,
                      child: DotsIndicator(
                        position: state.page,
                        dotsCount: 3,
                        mainAxisAlignment: MainAxisAlignment.center,
                        decorator: DotsDecorator(
                            color: Colors.grey,
                            activeColor: Colors.blue,
                            size: const Size.square(8.0),
                            activeSize: const Size(16.0, 8.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttomName, String title,
      String subtitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.h,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            subtitle,
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(index,
                  duration: const Duration(microseconds: 500),
                  curve: Curves.easeIn);
            } else {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1))
                ]),
            child: Center(
              child: Text(
                buttomName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        )
      ],
    );
  }
}
