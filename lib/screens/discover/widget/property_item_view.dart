import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate_ui/model/property_model.dart';
import 'package:real_estate_ui/screens/property_detail/property_detail_screen.dart';
import 'package:real_estate_ui/utils/color_res.dart';
import 'package:real_estate_ui/utils/style.dart';

class PropertyItemView extends StatelessWidget {
  final PropertyModel data;
  const PropertyItemView(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    List<String> promo = ['Featured', 'Low Price', 'Special', 'Luxury+'];
    List<Color> promoColor = [
      ColorRes.primaryColor,
      ColorRes.successColor,
      ColorRes.errorColor
    ];
    Random random = Random();
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return FractionallySizedBox(
              heightFactor: 0.9,
              child: PropertyDetailScreen(data),
            );
          },
        );
      },
      child: Container(
        height: 220.h,
        decoration: BoxDecoration(
          color: ColorRes.white,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
                child: Image.asset(
                  data.image.first,
                  height: 150.h,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          data.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Style.textStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            size: 18.sp,
                            color: Colors.orange,
                          ),
                          Text(
                            '${data.rating} (${data.review})',
                            style: Style.textStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '${data.bedInfo.bedroom} bedroom • ${data.bedInfo.beds} beds • ${data.bedInfo.bathroom} bathroom',
                    style: Style.textStyle(
                      color: ColorRes.grey,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: promoColor[random.nextInt(promo.length - 1)],
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 2.h,
                        ),
                        child: Text(
                          promo[random.nextInt(promo.length - 1)],
                          style: Style.textStyle(
                            color: ColorRes.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '₹${data.price}',
                              style: Style.textStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 14,
                                color: ColorRes.errorColor,
                              ),
                            ),
                            TextSpan(
                              text: '  ₹${data.offerPrice}',
                              style: Style.textStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorRes.successColor,
                                fontSize: 18,
                              ),
                            ),
                            TextSpan(
                              text: '  + GST',
                              style: Style.textStyle(
                                fontSize: 10,
                                color: ColorRes.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
