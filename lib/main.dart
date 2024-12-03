import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:real_estate_ui/screens/dashboard/dashboard_screen.dart';
import 'package:real_estate_ui/services/global_service.dart';
import 'package:real_estate_ui/utils/color_res.dart';
import 'package:real_estate_ui/utils/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = _MyHttpOverrides();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: ColorRes.white,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: getDesignSize(),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: Globals.instance.appName.value,
          scrollBehavior: _MyCustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              primary: ColorRes.primaryColor,
              seedColor: ColorRes.primaryColor,
              surface: ColorRes.backgroundColor,
            ),
            dialogTheme: const DialogTheme(
              backgroundColor: ColorRes.backgroundColor,
              surfaceTintColor: ColorRes.backgroundColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: Style.textStyle(
                  fontWeight: FontWeight.w600,
                  color: ColorRes.primaryColor,
                ),
              ),
            ),
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: ColorRes.backgroundColor,
              surfaceTintColor: ColorRes.backgroundColor,
            ),
            scaffoldBackgroundColor: ColorRes.backgroundColor,
            appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: ColorRes.backgroundColor,
              surfaceTintColor: Colors.transparent,
              titleTextStyle: Style.textStyle(
                fontWeight: FontWeight.w600,
                color: ColorRes.black,
                fontFamily: 'Ubuntu',
              ),
              iconTheme: IconThemeData(
                color: ColorRes.black,
                size: 20.h,
              ),
            ),
            cardTheme: CardTheme(
              margin: EdgeInsets.zero,
              color: ColorRes.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              elevation: 5,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorRes.primaryColor,
                foregroundColor: ColorRes.white,
                textStyle: Style.textStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
            useMaterial3: true,
            fontFamily: 'Ubuntu',
          ),
          home: const DashboardScreen(),
        );
      },
    );
  }

  Size getDesignSize() {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool largeScreen = width > 600;
    Globals.instance.changeLargeScreen(largeScreen);

    Size size;
    if (kIsWeb) {
      if (largeScreen && width < height) {
        size = const Size(800, 1000);
      } else if (largeScreen) {
        size = const Size(1440, 1040);
      } else {
        size = const Size(460, 690);
      }
    } else if (largeScreen) {
      size = const Size(800, 1280);
    } else {
      size = const Size(360, 690);
    }

    return size;
  }
}

class _MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class _MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
