import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:real_estate_ui/model/property_model.dart';
import 'package:real_estate_ui/screens/discover/widget/property_top_search_view.dart';
import 'package:real_estate_ui/screens/discover/widget/property_item_view.dart';
import 'package:real_estate_ui/services/global_service.dart';
import 'package:real_estate_ui/utils/assets_res.dart';
import 'package:real_estate_ui/utils/style.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  List<PropertyModel> propertys = [];
  List<PropertyModel> propertys2 = [];
  List<String> popularPlaces = [
    AssetsRes.popular1,
    AssetsRes.popular2,
    AssetsRes.popular7,
    AssetsRes.popular4,
    AssetsRes.popular5,
    AssetsRes.popular6,
    AssetsRes.popular3,
  ];

  @override
  void initState() {
    propertys.add(PropertyModel(
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
    propertys.add(PropertyModel(
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
    propertys.add(PropertyModel(
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
      price: 18000,
      offerPrice: 15000,
      review: 80,
      rating: 4.8,
      bedInfo: BedInfoModel(bedroom: 3, beds: 3, bathroom: 4),
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 3));
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics()
            .applyTo(const ClampingScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeTopSearchView(),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Nearby Properties',
                style: Style.textStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: Globals.instance.largeScreen ? 320.h : 220.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var data = propertys[index];
                  return SizedBox(
                    width:
                        Get.width / (Globals.instance.largeScreen ? 1.8 : 1.25),
                    child: PropertyItemView(data),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 16.w);
                },
                itemCount: propertys.length,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Popular cities',
                style: Style.textStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: Globals.instance.largeScreen ? 210.w : 140.w,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      popularPlaces[index],
                      width: Globals.instance.largeScreen ? 150.w : 100.w,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 16.w);
                },
                itemCount: popularPlaces.length,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Best Deals in Mumbai',
                style: Style.textStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Globals.instance.largeScreen ? 2 : 1,
                mainAxisExtent: Globals.instance.largeScreen ? 320.h : 220.h,
                crossAxisSpacing: 16.h,
                mainAxisSpacing: 16.h,
              ),
              physics: const NeverScrollableScrollPhysics(),
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
              padding: EdgeInsets.symmetric(horizontal: 16.w),
            ),
            SafeArea(top: false, child: SizedBox(height: 60.h)),
          ],
        ),
      ),
    );
  }
}
