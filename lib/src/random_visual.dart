import 'package:flutter/material.dart';
import 'random_generators.dart';

/// 随机视觉元素生成器
class RandomVisual {
  /// 生成随机颜色
  static Color randomColor({int? alpha}) {
    return Color.fromARGB(
      alpha ?? 255,
      RandomGenerators.randomInt(0, 255),
      RandomGenerators.randomInt(0, 255),
      RandomGenerators.randomInt(0, 255),
    );
  }

  /// 生成随机十六进制颜色字符串
  static String randomHexColor() {
    return '#${RandomGenerators.randomInt(0, 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
  }

  /// 生成随机Material Design颜色
  static Color randomMaterialColor() {
    final colors = [
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.deepPurple,
      Colors.indigo,
      Colors.blue,
      Colors.lightBlue,
      Colors.cyan,
      Colors.teal,
      Colors.green,
      Colors.lightGreen,
      Colors.lime,
      Colors.yellow,
      Colors.amber,
      Colors.orange,
      Colors.deepOrange,
      Colors.brown,
      Colors.grey,
      Colors.blueGrey
    ];
    return RandomGenerators.randomChoice(colors);
  }

  /// 生成随机图片URL（修复版本）
  static String randomImageUrl(
      {int width = 300, int height = 200, String? category}) {
    String url = 'https://picsum.photos';
    url = '$url/$width/$height';
    url = '$url?random=${RandomGenerators.randomInt(100, 999)}';
    return url;
  }

  /// 生成随机头像URL（修复版本，使用多个可靠的服务）
  static String randomAvatarUrl({int size = 200}) {
    final List<String> services = [
      'https://i.pravatar.cc/$size?random=${RandomGenerators.randomInt(1000, 9999)}',
      'https://picsum.photos/$size/$size?random=${RandomGenerators.randomInt(1000, 9999)}',
    ];
    return RandomGenerators.randomChoice(services);
  }
}
