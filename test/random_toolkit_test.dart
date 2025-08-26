import 'package:flutter_test/flutter_test.dart';
import 'package:random_toolkit/random_toolkit.dart';

void main() {
  group('RandomToolkit Tests', () {
    test('Random generators should work', () {
      // 测试随机整数生成
      final randomInt = RandomToolkit.generators.integer(1, 100);
      expect(randomInt, greaterThanOrEqualTo(1));
      expect(randomInt, lessThanOrEqualTo(100));

      // 测试随机字符串生成
      final randomString = RandomToolkit.generators.string(10);
      expect(randomString.length, equals(10));

      // 测试随机布尔值生成
      final randomBool = RandomToolkit.generators.boolean();
      expect(randomBool, isA<bool>());
    });

    test('Random person should work', () {
      // 测试随机姓名生成
      final chineseName = RandomToolkit.person.name(chinese: true);
      expect(chineseName, isNotEmpty);

      final englishName = RandomToolkit.person.name(chinese: false);
      expect(englishName, isNotEmpty);
    });

    test('Random visual should work', () {
      // 测试随机颜色生成
      final hexColor = RandomToolkit.visual.hexColor();
      expect(hexColor, startsWith('#'));
      expect(hexColor.length, equals(7));
    });
  });
}
