library random_toolkit;

// 导出所有模块
import 'src/random_generators.dart';
import 'src/random_person.dart';
import 'src/random_visual.dart';
import 'src/random_location.dart';
import 'src/random_datetime.dart';
import 'src/random_user.dart';

class RandomToolkit {
  RandomToolkit._();

  // 命名空间访问其他功能
  /// 视觉元素生成器
  static RandomVisual visual = RandomVisual();

  /// 人员生成器
  static RandomPerson person = RandomPerson();

  /// 位置生成器
  static RandomLocation location = RandomLocation();

  /// 日期时间生成器
  static RandomDateTime dateTime = RandomDateTime();

  /// 随机生成器
  static RandomGenerators generators = RandomGenerators();

  /// 用户生成器
  static RandomUser user = RandomUser();
}
