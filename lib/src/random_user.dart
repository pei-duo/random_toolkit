import 'random_generators.dart';
import 'random_person.dart';
import 'random_location.dart';
import 'random_visual.dart';
import 'random_datetime.dart';

/// 随机用户信息生成器
class RandomUser {
  /// 生成完整的随机用户信息
  Map<String, dynamic> generate({bool chinese = true}) {
    return {
      'id': RandomGenerators().uuid(),
      'name': RandomPerson().name(chinese: chinese),
      'email': RandomPerson().email(),
      'phone': RandomPerson().phoneNumber(countryCode: chinese ? 'CN' : 'US'),
      'address': RandomLocation().address(chinese: chinese),
      'avatar': RandomVisual().avatarUrl(),
      'birthDate': RandomDateTime()
          .date(start: DateTime(1950), end: DateTime(2005))
          .toIso8601String(),
      'isActive': RandomGenerators().boolean(),
      'score': RandomGenerators().integer(0, 100),
      'balance': RandomGenerators().decimal(0, 10000).toStringAsFixed(2),
    };
  }
}
