import 'dart:math';
import 'dart:typed_data';

/// 基础随机数生成器
class RandomGenerators {
  static final Random _random = Random();
  
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