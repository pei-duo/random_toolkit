import 'dart:math';
import 'random_toolkit_platform_interface.dart';

// 导出所有模块
export 'src/random_generators.dart';
export 'src/random_person.dart';
export 'src/random_visual.dart';
export 'src/random_location.dart';
export 'src/random_datetime.dart';
export 'src/random_user.dart';

class RandomToolkit {
  static final Random _random = Random();

  // 保留原有的平台版本获取功能
  Future<String?> getPlatformVersion() {
    return RandomToolkitPlatform.instance.getPlatformVersion();
  }
}
