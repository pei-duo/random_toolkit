# Random Toolkit

一个功能强大的Flutter随机数据生成工具包，提供各种类型的随机数据生成功能。

[![pub package](https://img.shields.io/pub/v/random_toolkit.svg)](https://pub.dev/packages/random_toolkit)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 功能特性

### 🎲 基础随机数据
- 随机整数、浮点数、布尔值
- 随机字符串（支持自定义字符集）
- UUID生成
- 数组随机选择和打乱

### 👤 个人信息生成
- 随机姓名（支持中文和英文）
- 随机邮箱地址
- 随机手机号码（中国大陆格式）

### 🎨 视觉元素
- 随机颜色（Color对象、十六进制字符串）
- Material Design颜色
- 随机图片URL
- 随机头像URL

### 📍 地理位置
- 随机地址（支持中文和英文）

### ⏰ 日期时间
- 随机日期
- 随机时间戳
- 自定义日期范围

### 👥 完整用户信息
- 生成包含所有信息的随机用户对象
- ID、姓名、邮箱、电话、地址、头像等

## 安装

在您的 `pubspec.yaml` 文件中添加依赖：

```yaml
dependencies:
  random_toolkit: ^0.0.1
```

并运行 `flutter pub get` 以获取依赖项。
```bash
flutter pub get
```

## 使用方法

### 导入包
在您的Dart文件中，导入 `random_toolkit` 包：

```dart
import 'package:random_toolkit/random_toolkit.dart';
```

### 生成随机整数
要生成一个随机整数，您可以使用 `RandomToolkit.generateInteger` 方法：

```dart
int randomInt = RandomToolkit.generateInteger();
```

### 生成随机字符串
要生成一个随机字符串，您可以使用 `RandomToolkit.generateString` 方法：

```dart
String randomString = RandomToolkit.generateString();
```

### 生成UUID
要生成一个UUID，您可以使用 `RandomToolkit.generateUUID` 方法：

```dart
String uuid = RandomToolkit.generateUUID();
```
### 个人信息生成
```dart
// 随机姓名
String chineseName = RandomPerson.randomChineseName();
String englishName = RandomPerson.randomEnglishName();

// 随机邮箱
String email = RandomPerson.randomEmail();

// 随机手机号
String phone = RandomPerson.randomPhoneNumber();
```

### 视觉元素
```dart
// 随机颜色
Color randomColor = RandomVisual.randomColor();

// 十六进制颜色字符串
String hexColor = RandomVisual.randomHexColor();

// Material Design颜色
Color materialColor = RandomVisual.randomMaterialColor();

// 随机图片URL
String imageUrl = RandomVisual.randomImageUrl(width: 300, height: 200);

// 随机头像URL
String avatarUrl = RandomVisual.randomAvatarUrl(size: 100);
```


### 地理位置
```dart
// 随机地址
String chineseAddress = RandomLocation.randomChineseAddress();
String englishAddress = RandomLocation.randomEnglishAddress();
```

### 日期时间
```dart
// 随机日期
DateTime randomDate = RandomDateTime.randomDate(
  start: DateTime(2020, 1, 1),
  end: DateTime(2024, 12, 31),
);

// 随机时间戳
int timestamp = RandomDateTime.randomTimestamp();d: DateTime(2024, 12, 31),
);
```
## 示例应用
查看 example 文件夹中的完整示例应用，了解如何在实际项目中使用所有功能。
```bash
cd example
flutter run
```
## 平台支持
- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux
## 版本要求
- Flutter: >= 2.5.0
- Dart: >= 2.19.6
## 贡献
欢迎提交 Issue 和 Pull Request！

1. Fork 这个项目
2. 创建您的功能分支 ( git checkout -b feature/AmazingFeature )
3. 提交您的更改 ( git commit -m 'Add some AmazingFeature' )
4. 推送到分支 ( git push origin feature/AmazingFeature )
5. 打开一个 Pull Request
## 许可证
本项目采用 MIT 许可证 - 查看 LICENSE 文件了解详情。

## 链接

- [GitHub 仓库](https://github.com/pei-duo/random_toolkit.git)
- [pub.dev 包页面](https://pub.dev/packages/random_toolkit)
- [API 文档](https://pub.dev/documentation/random_toolkit/latest/)

## 更新日志

查看 [CHANGELOG.md](CHANGELOG.md) 了解版本更新历史。