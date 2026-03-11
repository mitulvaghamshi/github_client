import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:window_to_front/window_to_front_platform_interface.dart';

/// An implementation of [WindowToFrontPlatform] that uses method channels.
class MethodChannelWindowToFront extends WindowToFrontPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final channel = const MethodChannel('window_to_front');

  @override
  Future<void> activate() async => channel.invokeMethod('activate');
}
