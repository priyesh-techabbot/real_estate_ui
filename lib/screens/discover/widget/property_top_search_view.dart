import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_ui/screens/search/search_screen.dart';
import 'package:real_estate_ui/services/global_service.dart';
import 'package:real_estate_ui/utils/assets_res.dart';
import 'package:real_estate_ui/utils/color_res.dart';
import 'package:real_estate_ui/utils/style.dart';

class HomeTopSearchView extends StatelessWidget {
  const HomeTopSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            ColorRes.black.withOpacity(0.4),
            BlendMode.darken,
          ),
          child: Image.asset(
            AssetsRes.homeBg,
            height: Globals.instance.largeScreen ? 140.h : 145.h,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.navigation,
                            size:
                                Globals.instance.largeScreen ? 16.sp : 14.sp,
                            color: ColorRes.white,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Mumbai, India',
                            style: Style.textStyle(
                              color: ColorRes.white,
                              fontSize:
                                  Globals.instance.largeScreen ? 14 : 12,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    Image.asset(
                      AssetsRes.user,
                      height: 22.sp,
                      color: ColorRes.white,
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return const FractionallySizedBox(
                          heightFactor: 0.9,
                          child: SearchScreen(),
                        );
                      },
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90.r),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorRes.white.withOpacity(0.2),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 6.h,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AssetsRes.search,
                              color: ColorRes.white,
                              height: 20.sp,
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Search for properties',
                                    style: Style.textStyle(
                                      color: ColorRes.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Flat • Bunglow • Farmhouse',
                                    style: Style.textStyle(
                                      color: ColorRes.ultraLightGrey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
