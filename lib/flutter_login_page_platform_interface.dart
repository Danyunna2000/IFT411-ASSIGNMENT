import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_login_page_method_channel.dart';

abstract class FlutterLoginPagePlatform extends PlatformInterface {
  /// Constructs a FlutterLoginPagePlatform.
  FlutterLoginPagePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterLoginPagePlatform _instance = MethodChannelFlutterLoginPage();

  /// The default instance of [FlutterLoginPagePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterLoginPage].
  static FlutterLoginPagePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterLoginPagePlatform] when
  /// they register themselves.
  static set instance(FlutterLoginPagePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
