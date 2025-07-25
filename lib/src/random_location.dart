import 'random_generators.dart';

/// 随机地理位置生成器
class RandomLocation {
   final List<String> _chineseCities = [
    '北京市',
    '上海市',
    '广州市',
    '深圳市',
    '杭州市',
    '南京市',
    '武汉市',
    '成都市',
  ];

   final List<String> _englishCities = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix',
    'Philadelphia'
  ];

   final List<String> _chineseStreets = [
    '中山路',
    '人民路',
    '解放路',
    '建设路',
    '新华路',
    '胜利路',
    '东风路',
    '红旗路',
  ];

   final List<String> _englishStreets = [
    'Main St',
    'First St',
    'Second St',
    'Park Ave',
    'Oak St',
    'Maple Ave'
  ];

  /// 生成随机地址
   String randomAddress({bool chinese = true}) {
    if (chinese) {
      final city = RandomGenerators().randomChoice(_chineseCities);
      final street = RandomGenerators().randomChoice(_chineseStreets);
      final number = RandomGenerators().randomInt(1, 9999);
      return '$city$street$number号';
    } else {
      final city = RandomGenerators().randomChoice(_englishCities);
      final street = RandomGenerators().randomChoice(_englishStreets);
      final number = RandomGenerators().randomInt(1, 9999);
      return '$number $street, $city';
    }
  }
}
