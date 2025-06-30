import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'random_toolkit_platform_interface.dart';

/// An implementation of [RandomToolkitPlatform] that uses method channels.
class MethodChannelRandomToolkit extends RandomToolkitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('random_toolkit');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
