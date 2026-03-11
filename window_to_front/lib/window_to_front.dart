import 'package:window_to_front/window_to_front_platform_interface.dart';

mixin WindowToFront {
  static Future<void> activate() => WindowToFrontPlatform.instance.activate();
}
