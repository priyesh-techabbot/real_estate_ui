import 'package:get/get.dart';

class Globals {
  static final Globals instance = Globals._();

  factory Globals() => instance;

  Globals._();

  final RxString appName = 'Crostate'.obs;

  final RxBool _largeScreen = false.obs;
  bool get largeScreen => _largeScreen.value;
  void changeLargeScreen(bool value) => _largeScreen.value = value;
}
