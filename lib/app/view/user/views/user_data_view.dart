import 'package:dipl/app/view/user/repository/user_vm.dart';
import 'package:dipl/app/view/user/views/widgets/empty.dart';
import 'package:dipl/core/utils/assets_path.dart';
import 'package:dipl/core/utils/enums.dart';
import 'package:dipl/core/utils/formatter.dart';
import 'package:dipl/core/utils/ui_helpers.dart';
import 'package:dipl/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:swipe/swipe.dart';

class UsersView extends ConsumerStatefulWidget {
  const UsersView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UsersViewState();
}

class _UsersViewState extends ConsumerState<UsersView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(userVMProvider.notifier).retrieveUserData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userPRead = ref.read(userVMProvider.notifier);
    final userP = ref.watch(userVMProvider);
    return Swipe(
      onSwipeLeft: userPRead.swipe,
      onSwipeRight: userPRead.swipe,
      child: Stack(
        children: [
          Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(24.h),
                child: Column(
                  children: [
                    const Text('Swipe Left or right to see more'),
                    Expanded(
                      child: Center(
                        child: userP.user == null
                            ? const EmptyUser()
                            : Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.h,
                                  vertical: 20.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(24.r),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 100.h,
                                      width: 100.h,
                                      decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: userP.user?.picture?.thumbnail !=
                                                  '' &&
                                              userP.user?.picture?.thumbnail !=
                                                  null
                                          ? ClipOval(
                                              child: UIHelpers.image(
                                                icon: userP.user?.picture
                                                        ?.thumbnail ??
                                                    '',
                                                fit: BoxFit.fill,
                                                isNetwork: true,
                                              ),
                                            )
                                          : null,
                                    ),
                                    Gap(20.h),
                                    Text(
                                      '''${userP.user?.name?.title ?? ''} ${userP.user?.name?.first ?? ''} ${userP.user?.name?.last ?? ''}''',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Gap(15.h),
                                    Text(
                                      '''${(userP.user?.gender ?? '').initialWordCap()} (${userP.user?.dob?.age ?? ''})''',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Gap(15.h),
                                    RichText(
                                      text: TextSpan(
                                        text: 'DOB: ',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: DateFormat().dateOnly(
                                              userP.user?.dob?.date ??
                                                  DateTime.now(),
                                            ),
                                            style: const TextStyle(
                                                color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Gap(15.h),
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text: 'Email: ',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: userP.user?.email ?? '',
                                            style: const TextStyle(
                                                color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Gap(15.h),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Phone: ',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: userP.user?.phone ?? '',
                                            style: const TextStyle(
                                                color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          UIHelpers.showLoader(
            isLoading: userP.loading == LoadingState.loading,
            context: context,
          ),
        ],
      ),
    );
  }
}
