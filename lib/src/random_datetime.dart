import 'random_generators.dart';

/// 随机日期时间生成器
class RandomDateTime {
  /// 生成随机日期
  DateTime date({DateTime? start, DateTime? end}) {
    start ??= DateTime(1970, 1, 1);
    end ??= DateTime.now();

    final difference = end.difference(start).inDays;
    final randomDays = RandomGenerators().integer(0, difference);

    return start.add(Duration(days: randomDays));
  }

  /// 生成随机时间戳
  int timestamp({DateTime? start, DateTime? end}) {
    return date(start: start, end: end).millisecondsSinceEpoch;
  }
}
