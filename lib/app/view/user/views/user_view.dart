import 'package:dipl/app/view/user/repository/user_vm.dart';
import 'package:dipl/core/utils/assets_path.dart';
import 'package:dipl/core/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class UserView extends ConsumerStatefulWidget {
  const UserView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserViewState();
}

class _UserViewState extends ConsumerState<UserView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(userVMProvider.notifier).setPosition(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userPRead = ref.read(userVMProvider.notifier);
    final userP = ref.watch(userVMProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Container(
                    height: 100.h,
                    width: 100.h,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                      image: userP.userFileImage != null
                          ? DecorationImage(
                              image: FileImage(userP.userFileImage!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: userP.userFileImage == null
                        ? ClipOval(
                            child: UIHelpers.image(
                              icon: Assets.images.avatarPNG,
                              fit: BoxFit.fill,
                            ),
                          )
                        : null,
                  ),
                ),
                Gap(20.h),
                InkWell(
                  onTap: userPRead.selectImage,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.h, vertical: 12.h),
                    color: Colors.blue,
                    child: const Text(
                      'Take a photo',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const Spacer(),
                RichText(
                  text: TextSpan(
                    text: 'Lat ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: userP.latitude.toString(),
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                Gap(10.h),
                RichText(
                  text: TextSpan(
                    text: 'Long ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: userP.longitude.toStringAsFixed(2),
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                Gap(32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
