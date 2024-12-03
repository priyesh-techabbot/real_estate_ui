import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:real_estate_ui/screens/discover/discover_screen.dart';
import 'package:real_estate_ui/services/global_service.dart';
import 'package:real_estate_ui/utils/assets_res.dart';
import 'package:real_estate_ui/utils/color_res.dart';
import 'package:real_estate_ui/utils/style.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Widget> screens = [const DiscoverScreen()];
  RxInt selectedInsex = RxInt(0);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: screens[selectedInsex.value],
        extendBody: true,
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    Globals.instance.largeScreen ? Get.width / 4.5 : 16.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(90.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: ColorRes.primaryColor.withOpacity(0.9),
                  ),
                  padding: EdgeInsets.all(4.h),
                  child: Row(
                    children: [
                      _bottomBarIcon(
                        icon: AssetsRes.compass,
                        index: 0,
                        lable: 'Discover',
                      ),
                      _bottomBarIcon(
                        icon: AssetsRes.heart,
                        index: 1,
                        lable: 'Favorite',
                      ),
                      _bottomBarIcon(
                        icon: AssetsRes.booking,
                        index: 2,
                        lable: 'Booking',
                      ),
                      _bottomBarIcon(
                        icon: AssetsRes.message,
                        index: 3,
                        lable: 'Message',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _bottomBarIcon(
      {required String icon, required String lable, required int index}) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            height: 20.h,
            color: selectedInsex.value == index
                ? ColorRes.white
                : ColorRes.ultraLightGrey,
          ),
          SizedBox(height: 3.h),
          Text(
            lable,
            style: Style.textStyle(
              fontSize: 11,
              color: selectedInsex.value == index
                  ? ColorRes.white
                  : ColorRes.ultraLightGrey,
              fontWeight: selectedInsex.value == index
                  ? FontWeight.w600
                  : FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
