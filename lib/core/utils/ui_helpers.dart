import 'package:cached_network_image/cached_network_image.dart';
import 'package:dipl/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shimmer/shimmer.dart';

class UIHelpers {
  static Widget image({
    required String icon,
    bool isNetwork = false,
    double? width,
    double? height,
    BoxFit? fit,
    String? fallBackImage,
    bool isFallBackAsset = false,
    Color? color,
  }) {
    if (isNetwork == true) {
      if (Constants.getImageExtension(icon) == 'svg') {
        return SvgPicture.network(
          icon,
          height: height,
          // color: color,
          width: width,
          fit: fit ?? BoxFit.cover,
          placeholderBuilder: (context) {
            return const CircularProgressIndicator();
          },
        );
      } else {
        return CachedNetworkImage(
          imageUrl: icon,
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          errorWidget: (context, url, error) => Image.network(
            fallBackImage ?? Constants.iconFallBack,
            height: height,
          ),
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Theme.of(context).highlightColor.withOpacity(0.4),
            highlightColor: Theme.of(context).highlightColor.withOpacity(0.2),
            // enabled: true,
            child: Container(
              color: Colors.grey.shade500,
            ),
          ),
        );
      }
    } else {
      if (Constants.getImageExtension(icon) == 'svg') {
        return SvgPicture.asset(
          icon,
          height: height,
          colorFilter: ColorFilter.mode(
            color ?? Colors.transparent,
            color == null ? BlendMode.screen : BlendMode.srcIn,
          ),
          width: width,
          fit: fit ?? BoxFit.scaleDown,
        );
      } else {
        return Image.asset(
          icon,
          height: height,
          color: color,
          width: width,
          fit: fit ?? BoxFit.scaleDown,
          errorBuilder: (context, error, stackTrace) {
            return isFallBackAsset
                ? Image.asset(
                    fallBackImage ?? '',
                    height: height,
                    color: color,
                    width: width,
                    fit: fit ?? BoxFit.scaleDown,
                  )
                : Image.network(
                    fallBackImage ?? Constants.iconFallBack,
                    height: height,
                  );
          },
        );
      }
    }
  }

  static Widget showLoader({
    required bool isLoading,
    required BuildContext context,
    Color? color,
  }) =>
      isLoading
          ? Scaffold(
              backgroundColor: color ??
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(.3),
              body: loaderWidget(),
            )
          : const SizedBox(
              height: 0,
            );

  static Widget loaderWidget() => Center(
        child: SizedBox(
          height: 70.h,
          width: 70.h,
          child: const LoadingIndicator(
            indicatorType: Indicator.ballPulse,
            colors: [
              Colors.red,
              Colors.blue,
              Colors.orange,
            ],
            strokeWidth: 2,
            backgroundColor: Colors.transparent,
            pathBackgroundColor: Colors.transparent,
          ),
        ),
      );
}
