import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_login_page_platform_interface.dart';

/// An implementation of [FlutterLoginPagePlatform] that uses method channels.
class MethodChannelFlutterLoginPage extends FlutterLoginPagePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_login_page');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
