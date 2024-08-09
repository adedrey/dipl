import 'package:dipl/app/view/user/repository/user_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class EmptyUser extends ConsumerWidget {
  const EmptyUser({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('No data yet..'),
        Gap(20.h),
        InkWell(
          onTap: () => ref.read(userVMProvider.notifier).retrieveUserData(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 12.h),
            color: Colors.blue,
            child: const Text(
              'Refresh',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
