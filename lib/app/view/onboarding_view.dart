// ignore_for_file: inference_failure_on_instance_creation

import 'package:dipl/app/view/user/views/user_data_view.dart';
import 'package:dipl/app/view/user/views/user_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserView(),
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 12.h),
                color: Colors.blue,
                child: const Text(
                  'Task 1 - GPS',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Gap(20.h),
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const UsersView(),
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 12.h),
                color: Colors.blue,
                child: const Text(
                  'Task 2 - API Fetch',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
