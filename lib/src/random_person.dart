import 'random_generators.dart';

/// 随机个人信息生成器
class RandomPerson {
   final List<String> _chineseFirstNames = [
    '张伟',
    '王芳',
    '李娜',
    '刘洋',
    '陈静',
    '杨明',
    '赵丽',
    '黄强',
    '周敏',
    '吴华',
    '徐艳',
    '朱军',
    '林红',
    '何勇',
    '郭亮',
    '马超',
    '罗敏',
    '梁静',
    '宋伟',
    '唐丽',
  ];

   final List<String> _englishFirstNames = [
    'James',
    'Mary',
    'John',
    'Patricia',
    'Robert',
    'Jennifer',
    'Michael',
    'Linda',
    'William',
    'Elizabeth',
    'David',
    'Barbara',
    'Richard',
    'Susan',
    'Joseph',
    'Jessica'
  ];

   final List<String> _englishLastNames = [
    'Smith',
    'Johnson',
    'Williams',
    'Brown',
    'Jones',
    'Garcia',
    'Miller',
    'Davis'
  ];

  /// 生成随机姓名
   String randomName({bool chinese = true}) {
    if (chinese) {
      return RandomGenerators().randomChoice(_chineseFirstNames);
    } else {
      final firstName = RandomGenerators().randomChoice(_englishFirstNames);
      final lastName = RandomGenerators().randomChoice(_englishLastNames);
      return '$firstName $lastName';
    }
  }

  /// 生成随机邮箱地址
   String randomEmail() {
    final domains = [
      'gmail.com',
      'yahoo.com',
      'hotmail.com',
      '163.com',
      'qq.com',
      'sina.com'
    ];
    final username = RandomGenerators().randomString(
            RandomGenerators().randomInt(5, 12),
            includeNumbers: true)
        .toLowerCase();
    final domain = RandomGenerators().randomChoice(domains);
    return '$username@$domain';
  }

  /// 生成随机手机号码
   String randomPhoneNumber({String countryCode = 'CN'}) {
    if (countryCode == 'CN') {
      final prefixes = [
        '130',
        '131',
        '132',
        '133',
        '134',
        '135',
        '136',
        '137',
        '138',
        '139',
        '150',
        '151',
        '152',
        '153',
        '155',
        '156',
        '157',
        '158',
        '159',
        '180',
        '181',
        '182',
        '183',
        '184',
        '185',
        '186',
        '187',
        '188',
        '189'
      ];
      final prefix = RandomGenerators().randomChoice(prefixes);
      final suffix =
          List.generate(8, (_) => RandomGenerators().randomInt(0, 9)).join();
      return '$prefix$suffix';
    } else {
      // 美国格式
      final areaCode = RandomGenerators().randomInt(200, 999);
      final exchange = RandomGenerators().randomInt(200, 999);
      final number = RandomGenerators().randomInt(1000, 9999);
      return '($areaCode) $exchange-$number';
    }
  }
}
