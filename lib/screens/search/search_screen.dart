import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:real_estate_ui/model/property_model.dart';
import 'package:real_estate_ui/screens/discover/widget/property_item_view.dart';
import 'package:real_estate_ui/services/global_service.dart';
import 'package:real_estate_ui/utils/assets_res.dart';
import 'package:real_estate_ui/utils/color_res.dart';
import 'package:real_estate_ui/utils/style.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  RxInt imageIndex = RxInt(0);

  List<PropertyModel> propertys2 = [];

  @override
  void initState() {
    propertys2.add(PropertyModel(
      image: [
        AssetsRes.building6,
        AssetsRes.hall1,
        AssetsRes.hall3,
        AssetsRes.hall2,
        AssetsRes.room2,
        AssetsRes.room1,
        AssetsRes.bathroom2,
        AssetsRes.bathroom1,
      ],
      name: 'Kanakia Luxury Valley',
      price: 83000,
      offerPrice: 65000,
      review: 80,
      rating: 4.8,
      bedInfo: BedInfoModel(bedroom: 5, beds: 5, bathroom: 6),
    ));
    propertys2.add(PropertyModel(
      image: [
        AssetsRes.hall3,
        AssetsRes.hall1,
        AssetsRes.building3,
        AssetsRes.hall2,
        AssetsRes.room2,
        AssetsRes.room1,
        AssetsRes.bathroom2,
        AssetsRes.bathroom1,
      ],
      name: 'Kanakia Rainforest',
      price: 38000,
      offerPrice: 35000,
      review: 80,
      rating: 4.8,
      bedInfo: BedInfoModel(bedroom: 5, beds: 5, bathroom: 4),
    ));

    propertys2.add(PropertyModel(
      image: [
        AssetsRes.building4,
        AssetsRes.room1,
        AssetsRes.room2,
        AssetsRes.hall1,
        AssetsRes.bathroom1,
        AssetsRes.hall2,
        AssetsRes.hall3,
        AssetsRes.bathroom2,
      ],
      name: 'Lokhandwala Minerva',
      price: 81200,
      offerPrice: 65000,
      review: 120,
      rating: 4.9,
      bedInfo: BedInfoModel(bedroom: 8, beds: 8, bathroom: 10),
    ));
    propertys2.add(PropertyModel(
      image: [
        AssetsRes.building5,
        AssetsRes.hall2,
        AssetsRes.room2,
        AssetsRes.bathroom1,
        AssetsRes.hall3,
        AssetsRes.room1,
        AssetsRes.hall1,
        AssetsRes.bathroom2,
      ],
      name: 'Adani Western Heights',
      price: 48000,
      offerPrice: 32000,
      review: 380,
      rating: 4.8,
      bedInfo: BedInfoModel(bedroom: 4, beds: 4, bathroom: 4),
    ));
    propertys2.add(PropertyModel(
      image: [
        AssetsRes.building1,
        AssetsRes.hall4,
        AssetsRes.room1,
        AssetsRes.room2,
        AssetsRes.hall1,
        AssetsRes.bathroom1,
        AssetsRes.hall2,
        AssetsRes.hall3,
        AssetsRes.bathroom2,
      ],
      name: 'Rustomjee Crown',
      price: 50000,
      offerPrice: 42500,
      review: 120,
      rating: 4.9,
      bedInfo: BedInfoModel(bedroom: 6, beds: 6, bathroom: 8),
    ));
    propertys2.add(PropertyModel(
      image: [
        AssetsRes.building2,
        AssetsRes.hall2,
        AssetsRes.room2,
        AssetsRes.bathroom1,
        AssetsRes.hall3,
        AssetsRes.room1,
        AssetsRes.hall1,
        AssetsRes.bathroom2,
      ],
      name: 'Lodha Marquise',
      price: 51000,
      offerPrice: 43000,
      review: 380,
      rating: 4.8,
      bedInfo: BedInfoModel(bedroom: 5, beds: 6, bathroom: 7),
    ));
    propertys2.add(PropertyModel(
      image: [
        AssetsRes.building3,
        AssetsRes.hall1,
        AssetsRes.hall3,
        AssetsRes.hall2,
        AssetsRes.room2,
        AssetsRes.room1,
        AssetsRes.bathroom2,
        AssetsRes.bathroom1,
      ],
      name: 'Indiabulls Sky Forest',
      price: 80500,
      offerPrice: 61800,
      review: 80,
      rating: 4.8,
      bedInfo: BedInfoModel(bedroom: 6, beds: 6, bathroom: 8),
    ));
    super.initState();
  }

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Padding(
                        padding: EdgeInsets.all(4.h),
                        child: Image.asset(
                          AssetsRes.close,
                          height: 18.sp,
                          color: ColorRes.black,
                        ),
                      ),
                    ),
                    Text(
                      'Search',
                      style: Style.textStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Image.asset(
                      AssetsRes.filter,
                      height: 18.sp,
                      color: ColorRes.black,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: ColorRes.white,
                  borderRadius: BorderRadius.circular(90.r),
                ),
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 6.h,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetsRes.search,
                      color: ColorRes.black,
                      height: 18.sp,
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mumbai, India',
                            style: Style.textStyle(
                              color: ColorRes.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '>= 4 BHK flat',
                            style: Style.textStyle(
                              color: ColorRes.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: Globals.instance.largeScreen ? 2 : 1,
                    mainAxisExtent:
                        Globals.instance.largeScreen ? 320.h : 220.h,
                    crossAxisSpacing: 16.h,
                    mainAxisSpacing: 16.h,
                  ),
                  physics: const AlwaysScrollableScrollPhysics()
                      .applyTo(const ClampingScrollPhysics()),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = propertys2[index];
                    return SizedBox(
                      width: double.maxFinite,
                      height: Globals.instance.largeScreen ? 320.h : 220.h,
                      child: PropertyItemView(data),
                    );
                  },
                  itemCount: propertys2.length,
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    bottom: 30.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
