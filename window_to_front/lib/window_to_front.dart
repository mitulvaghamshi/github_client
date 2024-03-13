import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

@immutable
class WindowToFront {
  static const _channel = MethodChannel('window_to_front');

  static Future<String?> get platformVersion async =>
      _channel.invokeMethod('getPlatformVersion');

  static Future<void> activate() async => _channel.invokeMethod('activate');
}
