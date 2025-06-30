import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'random_toolkit_method_channel.dart';

abstract class RandomToolkitPlatform extends PlatformInterface {
  /// Constructs a RandomToolkitPlatform.
  RandomToolkitPlatform() : super(token: _token);

  static final Object _token = Object();

  static RandomToolkitPlatform _instance = MethodChannelRandomToolkit();

  /// The default instance of [RandomToolkitPlatform] to use.
  ///
  /// Defaults to [MethodChannelRandomToolkit].
  static RandomToolkitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [RandomToolkitPlatform] when
  /// they register themselves.
  static set instance(RandomToolkitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
