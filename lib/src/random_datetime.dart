import 'random_generators.dart';

/// 随机日期时间生成器
class RandomDateTime {
  /// 生成随机日期
  static DateTime randomDate({DateTime? start, DateTime? end}) {
    start ??= DateTime(1970, 1, 1);
    end ??= DateTime.now();
    
    final difference = end.difference(start).inDays;
    final randomDays = RandomGenerators.randomInt(0, difference);
    
    return start.add(Duration(days: randomDays));
  }
  
  /// 生成随机时间戳
  static int randomTimestamp({DateTime? start, DateTime? end}) {
    return randomDate(start: start, end: end).millisecondsSinceEpoch;
  }
}