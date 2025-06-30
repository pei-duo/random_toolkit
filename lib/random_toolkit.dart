
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'random_toolkit_platform_interface.dart';

class RandomToolkit {
  static final Random _random = Random();
  
  // 保留原有的平台版本获取功能
  Future<String?> getPlatformVersion() {
    return RandomToolkitPlatform.instance.getPlatformVersion();
  }

  // ============ 基础随机数生成 ============
  
  /// 生成指定范围内的随机整数
  static int randomInt(int min, int max) {
    return min + _random.nextInt(max - min + 1);
  }
  
  /// 生成指定范围内的随机浮点数
  static double randomDouble(double min, double max) {
    return min + _random.nextDouble() * (max - min);
  }
  
  /// 生成随机布尔值
  static bool randomBool() {
    return _random.nextBool();
  }

  // ============ 随机字符串生成 ============
  
  /// 生成随机字符串
  static String randomString(int length, {bool includeNumbers = true, bool includeSymbols = false}) {
    const letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    const symbols = '!@#\$%^&*()_+-=[]{}|;:,.<>?';
    
    String chars = letters;
    if (includeNumbers) chars += numbers;
    if (includeSymbols) chars += symbols;
    
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(_random.nextInt(chars.length))));
  }
  
  /// 生成随机UUID
  static String randomUUID() {
    final bytes = Uint8List(16);
    for (int i = 0; i < 16; i++) {
      bytes[i] = _random.nextInt(256);
    }
    
    bytes[6] = (bytes[6] & 0x0f) | 0x40; // Version 4
    bytes[8] = (bytes[8] & 0x3f) | 0x80; // Variant bits
    
    final hex = bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
    return '${hex.substring(0, 8)}-${hex.substring(8, 12)}-${hex.substring(12, 16)}-${hex.substring(16, 20)}-${hex.substring(20, 32)}';
  }

  // ============ 随机姓名生成 ============
  
  static const List<String> _firstNames = [
    '张伟', '王芳', '李娜', '刘洋', '陈静', '杨明', '赵丽', '黄强', '周敏', '吴华',
    '徐艳', '朱军', '林红', '何勇', '郭亮', '马超', '罗敏', '梁静', '宋伟', '唐丽',
    'James', 'Mary', 'John', 'Patricia', 'Robert', 'Jennifer', 'Michael', 'Linda',
    'William', 'Elizabeth', 'David', 'Barbara', 'Richard', 'Susan', 'Joseph', 'Jessica'
  ];
  
  static const List<String> _lastNames = [
    '张', '王', '李', '刘', '陈', '杨', '赵', '黄', '周', '吴',
    'Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Garcia', 'Miller', 'Davis'
  ];
  
  /// 生成随机姓名
  static String randomName({bool chinese = true}) {
    if (chinese) {
      return _firstNames[_random.nextInt(_firstNames.length)];
    } else {
      final firstName = _firstNames.where((name) => name.contains(RegExp(r'[a-zA-Z]'))).toList();
      final lastName = _lastNames.where((name) => name.contains(RegExp(r'[a-zA-Z]'))).toList();
      return '${firstName[_random.nextInt(firstName.length)]} ${lastName[_random.nextInt(lastName.length)]}';
    }
  }

  // ============ 随机颜色生成 ============
  
  /// 生成随机颜色
  static Color randomColor({int? alpha}) {
    return Color.fromARGB(
      alpha ?? 255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }
  
  /// 生成随机十六进制颜色字符串
  static String randomHexColor() {
    return '#${(_random.nextInt(0xFFFFFF)).toRadixString(16).padLeft(6, '0').toUpperCase()}';
  }
  
  /// 生成随机Material Design颜色
  static Color randomMaterialColor() {
    final colors = [
      Colors.red, Colors.pink, Colors.purple, Colors.deepPurple,
      Colors.indigo, Colors.blue, Colors.lightBlue, Colors.cyan,
      Colors.teal, Colors.green, Colors.lightGreen, Colors.lime,
      Colors.yellow, Colors.amber, Colors.orange, Colors.deepOrange,
      Colors.brown, Colors.grey, Colors.blueGrey
    ];
    return colors[_random.nextInt(colors.length)];
  }

  // ============ 随机联系信息生成 ============
  
  /// 生成随机手机号码（中国大陆格式）
  static String randomPhoneNumber({String countryCode = 'CN'}) {
    if (countryCode == 'CN') {
      final prefixes = ['130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
                       '150', '151', '152', '153', '155', '156', '157', '158', '159',
                       '180', '181', '182', '183', '184', '185', '186', '187', '188', '189'];
      final prefix = prefixes[_random.nextInt(prefixes.length)];
      final suffix = List.generate(8, (_) => _random.nextInt(10)).join();
      return '$prefix$suffix';
    } else {
      // 美国格式
      final areaCode = randomInt(200, 999);
      final exchange = randomInt(200, 999);
      final number = randomInt(1000, 9999);
      return '($areaCode) $exchange-$number';
    }
  }
  
  /// 生成随机邮箱地址
  static String randomEmail() {
    final domains = ['gmail.com', 'yahoo.com', 'hotmail.com', '163.com', 'qq.com', 'sina.com'];
    final username = randomString(randomInt(5, 12), includeNumbers: true).toLowerCase();
    final domain = domains[_random.nextInt(domains.length)];
    return '$username@$domain';
  }

  // ============ 随机地址生成 ============
  
  static const List<String> _cities = [
    '北京市', '上海市', '广州市', '深圳市', '杭州市', '南京市', '武汉市', '成都市',
    'New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix', 'Philadelphia'
  ];
  
  static const List<String> _streets = [
    '中山路', '人民路', '解放路', '建设路', '新华路', '胜利路', '东风路', '红旗路',
    'Main St', 'First St', 'Second St', 'Park Ave', 'Oak St', 'Maple Ave'
  ];
  
  /// 生成随机地址
  static String randomAddress({bool chinese = true}) {
    final city = _cities[_random.nextInt(_cities.length)];
    final street = _streets[_random.nextInt(_streets.length)];
    final number = randomInt(1, 9999);
    
    if (chinese) {
      return '$city${street}${number}号';
    } else {
      return '$number $street, $city';
    }
  }

  // ============ 随机日期时间生成 ============
  
  /// 生成随机日期
  static DateTime randomDate({DateTime? start, DateTime? end}) {
    start ??= DateTime(1970, 1, 1);
    end ??= DateTime.now();
    
    final difference = end.difference(start).inDays;
    final randomDays = _random.nextInt(difference + 1);
    
    return start.add(Duration(days: randomDays));
  }
  
  /// 生成随机时间戳
  static int randomTimestamp({DateTime? start, DateTime? end}) {
    return randomDate(start: start, end: end).millisecondsSinceEpoch;
  }

  // ============ 随机图片URL生成 ============
  
  /// 生成随机图片URL（使用占位图服务）
  static String randomImageUrl({int width = 300, int height = 200, String? category}) {
    final categories = ['nature', 'city', 'people', 'animals', 'food', 'tech'];
    final selectedCategory = category ?? categories[_random.nextInt(categories.length)];
    
    // 使用 Lorem Picsum 服务
    final id = randomInt(1, 1000);
    return 'https://picsum.photos/id/$id/${width}x$height';
  }
  
  /// 生成随机头像URL
  static String randomAvatarUrl({bool male = true}) {
    final gender = male ? 'men' : 'women';
    final id = randomInt(1, 99);
    return 'https://randomuser.me/api/portraits/$gender/$id.jpg';
  }

  // ============ 随机数据组合生成 ============
  
  /// 生成随机用户信息
  static Map<String, dynamic> randomUser({bool chinese = true}) {
    return {
      'id': randomUUID(),
      'name': randomName(chinese: chinese),
      'email': randomEmail(),
      'phone': randomPhoneNumber(countryCode: chinese ? 'CN' : 'US'),
      'address': randomAddress(chinese: chinese),
      'avatar': randomAvatarUrl(male: randomBool()),
      'birthDate': randomDate(start: DateTime(1950), end: DateTime(2005)).toIso8601String(),
      'isActive': randomBool(),
      'score': randomInt(0, 100),
      'balance': randomDouble(0, 10000).toStringAsFixed(2),
    };
  }
  
  /// 从列表中随机选择元素
  static T randomChoice<T>(List<T> list) {
    if (list.isEmpty) throw ArgumentError('List cannot be empty');
    return list[_random.nextInt(list.length)];
  }
  
  /// 从列表中随机选择多个元素
  static List<T> randomChoices<T>(List<T> list, int count, {bool allowDuplicates = false}) {
    if (list.isEmpty) throw ArgumentError('List cannot be empty');
    if (!allowDuplicates && count > list.length) {
      throw ArgumentError('Count cannot be greater than list length when duplicates are not allowed');
    }
    
    final result = <T>[];
    final available = List<T>.from(list);
    
    for (int i = 0; i < count; i++) {
      final index = _random.nextInt(available.length);
      result.add(available[index]);
      
      if (!allowDuplicates) {
        available.removeAt(index);
      }
    }
    
    return result;
  }
  
  /// 打乱列表顺序
  static List<T> shuffle<T>(List<T> list) {
    final shuffled = List<T>.from(list);
    shuffled.shuffle(_random);
    return shuffled;
  }
}
