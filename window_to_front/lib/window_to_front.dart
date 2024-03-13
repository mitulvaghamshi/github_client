import 'window_to_front_platform_interface.dart';

class WindowToFront {
  static Future<void> activate() => WindowToFrontPlatform.instance.activate();
}
