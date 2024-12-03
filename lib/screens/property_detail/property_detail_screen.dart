import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:real_estate_ui/model/property_model.dart';
import 'package:real_estate_ui/services/global_service.dart';
import 'package:real_estate_ui/utils/assets_res.dart';
import 'package:real_estate_ui/utils/color_res.dart';
import 'package:real_estate_ui/utils/common/evolved_button.dart';
import 'package:real_estate_ui/utils/style.dart';

class PropertyDetailScreen extends StatefulWidget {
  final PropertyModel data;
  const PropertyDetailScreen(this.data, {super.key});

  @override
  State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  RxInt imageIndex = RxInt(0);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.r),
        topRight: Radius.circular(30.r),
      ),
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 3));
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics()
                .applyTo(const ClampingScrollPhysics()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r),
                      ),
                      child: AspectRatio(
                        aspectRatio: 16 / 13,
                        child: PageView.builder(
                          onPageChanged: (value) {
                            imageIndex.value = value;
                          },
                          itemBuilder: (context, index) {
                            return Image.asset(
                              widget.data.image[index],
                              width: double.maxFinite,
                              fit: BoxFit.cover,
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.data.image.length,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10.h,
                      left: 10.h,
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: ClipOval(
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorRes.black.withOpacity(0.4),
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(6.h),
                              child: Image.asset(
                                AssetsRes.close,
                                height: 16.sp,
                                color: ColorRes.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10.h,
                      right: 10.h,
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorRes.black.withOpacity(0.4),
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(6.h),
                            child: Image.asset(
                              AssetsRes.share,
                              height: 18.sp,
                              color: ColorRes.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10.h,
                      right: 10.h,
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorRes.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 4.h),
                            child: Obx(
                              () => Text(
                                '${imageIndex.value + 1} / ${widget.data.image.length}',
                                style: Style.textStyle(
                                  color: ColorRes.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.data.name,
                                  style: Style.textStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star_rounded,
                                      size: 22.sp,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      '${widget.data.rating} (${widget.data.review})',
                                      style: Style.textStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '  ₹${widget.data.offerPrice}',
                                style: Style.textStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ColorRes.successColor,
                                ),
                              ),
                              Text(
                                '₹${widget.data.price}',
                                style: Style.textStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 12,
                                  color: ColorRes.errorColor,
                                ),
                              ),
                              Text(
                                '+ ₹${widget.data.tax} GST',
                                style: Style.textStyle(
                                  fontSize: 10,
                                  color: ColorRes.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(height: 20.h, color: ColorRes.ultraLightGrey),
                      Text(
                        'Aminities',
                        style: Style.textStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Wrap(
                        runSpacing: 5.h,
                        spacing: 5.w,
                        children: [
                          'Clubhouse',
                          'Swimming pool',
                          'Garden',
                          'Private Parking',
                          'Play Area',
                          'Theator',
                          'Hall',
                          '24h CCTV',
                          '2 Security Gate',
                          'Guest Parking',
                          'Pet Allowed',
                        ]
                            .map(
                              (e) => Container(
                                decoration: BoxDecoration(
                                  color: ColorRes.ultraLightGrey,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 2.h,
                                ),
                                child: Text(e),
                              ),
                            )
                            .toList(),
                      ),
                      Divider(height: 20.h, color: ColorRes.ultraLightGrey),
                      Row(
                        children: [
                          Image.asset(
                            AssetsRes.checkin,
                            height: 20.sp,
                            color: ColorRes.black,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            '24H secirity check at gate',
                            style: Style.textStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        '2 Gates with guest checking and CCTV servelance',
                        style: Style.textStyle(
                          color: ColorRes.grey,
                          fontSize: 11,
                        ),
                      ),
                      Divider(height: 20.h, color: ColorRes.ultraLightGrey),
                      Row(
                        children: [
                          Image.asset(
                            AssetsRes.checkin,
                            height: 20.sp,
                            color: ColorRes.black,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Feels like Resort',
                            style: Style.textStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'On site Clubhouse, Swimming pool, and Theator',
                        style: Style.textStyle(
                          color: ColorRes.grey,
                          fontSize: 11,
                        ),
                      ),
                      SafeArea(top: false, child: SizedBox(height: 50.h)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        extendBody: true,
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(90.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: Globals.instance.largeScreen ? 60.h : 50.h,
                  decoration: BoxDecoration(
                    color: ColorRes.black.withOpacity(0.8),
                  ),
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 6.w,
                    top: 5.h,
                    bottom: 5.h,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Reserve this proporty at',
                              style: Style.textStyle(
                                color: ColorRes.darkWhite,
                                fontSize: 11,
                              ),
                            ),
                            Text(
                              '₹${widget.data.offerPrice / 4 + widget.data.tax}',
                              style: Style.textStyle(
                                fontWeight: FontWeight.w600,
                                color: ColorRes.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      EvolvedButton(
                        title: 'Book Now',
                        onTap: () {},
                        dynamicSize: true,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 6.h,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
