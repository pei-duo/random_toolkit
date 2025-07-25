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
      'id': RandomGenerators().randomUUID(),
      'name': RandomPerson().randomName(chinese: chinese),
      'email': RandomPerson().randomEmail(),
      'phone':
          RandomPerson().randomPhoneNumber(countryCode: chinese ? 'CN' : 'US'),
      'address': RandomLocation().randomAddress(chinese: chinese),
      'avatar': RandomVisual().randomAvatarUrl(),
      'birthDate':
          RandomDateTime().randomDate(start: DateTime(1950), end: DateTime(2005))
              .toIso8601String(),
      'isActive': RandomGenerators().randomBool(),
      'score': RandomGenerators().randomInt(0, 100),
      'balance': RandomGenerators().randomDouble(0, 10000).toStringAsFixed(2),
    };
  }
}
