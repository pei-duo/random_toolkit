# 更新日志

本文档记录了 Random Toolkit 项目的所有重要更改。

格式基于 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.0.0/)，
并且本项目遵循 [语义化版本](https://semver.org/lang/zh-CN/)。

## [0.0.4] - 2025-01-15

### 重大变更 (Breaking Changes)

- 🔄 **API 函数名称简化**
  - 所有函数名称移除 `random` 前缀，使API更简洁
  - `randomInt()` → `integer()`
  - `randomDouble()` → `decimal()`
  - `randomBool()` → `boolean()`
  - `randomString()` → `string()`
  - `randomUUID()` → `uuid()`
  - `randomChoice()` → `choice()`
  - `randomChoices()` → `choices()`
  - `randomColor()` → `color()`
  - `randomHexColor()` → `hexColor()`
  - `randomMaterialColor()` → `materialColor()`
  - `randomImageUrl()` → `imageUrl()`
  - `randomAvatarUrl()` → `avatarUrl()`
  - `randomName()` → `name()`
  - `randomEmail()` → `email()`
  - `randomPhoneNumber()` → `phoneNumber()`
  - `randomAddress()` → `address()`
  - `randomDate()` → `date()`
  - `randomTimestamp()` → `timestamp()`

### 改进

- 📚 **文档更新**
  - 更新 README.md 中的所有示例代码
  - 添加完整的 API 使用示例
  - 改进代码注释和文档结构

- 🧪 **测试验证**
  - 验证所有函数名称变更的正确性
  - 确保示例应用正常运行
  - 通过完整的功能测试

### 迁移指南

如果您正在使用旧版本，请按以下方式更新您的代码：

```dart
// 旧版本
int num = RandomToolkit.generators.randomInt(1, 100);
String name = RandomToolkit.person.randomName();
Color color = RandomToolkit.visual.randomColor();

// 新版本
int num = RandomToolkit.generators.integer(1, 100);
String name = RandomToolkit.person.name();
Color color = RandomToolkit.visual.color();
```

## [0.0.3] - 2025-01-15

### 新增

- 🎯 **API 命名空间支持**
  - 添加`RandomToolkit.visual.color()`等命名空间调用方式
  - 支持`RandomToolkit.person.name()`等统一访问入口
  - 保留所有原始类调用方式实现向后兼容

### 改进

- 🧱 **代码架构优化**
  - 通过静态委托实现统一 API 入口
  - 添加`@nodoc`注解隐藏内部构造函数
  - 改进文档注释的可读性

### 技术特性

- 📚 墨菲定律原则：
  - 所有原始类保持独立可访问
  - 命名空间实例自动初始化
  - 支持混合使用新旧 API

## [0.0.2] - 2024-12-19

### 修复

- 🔧 **Android 构建问题**
  - 修复了 Android 模块缺少 `namespace` 配置导致的构建失败问题
  - 在 `android/build.gradle` 中添加了 `namespace 'com.example.random_toolkit'` 配置
  - 解决了外部项目引用插件时出现的 "Namespace not specified" 错误

### 改进

- 📦 **发布准备**
  - 完善了项目配置以符合 pub.dev 发布要求
  - 优化了 Android Gradle Plugin 兼容性

## [0.0.1] - 2024-12-19

### 新增功能

- 🎲 **基础随机数据生成**

  - 随机整数生成 (`randomInt`)
  - 随机浮点数生成 (`randomDouble`)
  - 随机布尔值生成 (`randomBool`)
  - 随机字符串生成 (`randomString`)
  - UUID 生成 (`randomUUID`)
  - 数组随机选择 (`randomChoice`, `randomChoices`)
  - 数组随机打乱 (`shuffle`)

- 👤 **个人信息生成**

  - 随机中文姓名生成 (`randomChineseName`)
  - 随机英文姓名生成 (`randomEnglishName`)
  - 随机邮箱地址生成 (`randomEmail`)
  - 随机手机号码生成 (`randomPhoneNumber`)

- 🎨 **视觉元素生成**

  - 随机颜色生成 (`randomColor`)
  - 随机十六进制颜色字符串 (`randomHexColor`)
  - Material Design 颜色生成 (`randomMaterialColor`)
  - 随机图片 URL 生成 (`randomImageUrl`)
  - 随机头像 URL 生成 (`randomAvatarUrl`)

- 📍 **地理位置生成**

  - 随机中文地址生成 (`randomChineseAddress`)
  - 随机英文地址生成 (`randomEnglishAddress`)

- ⏰ **日期时间生成**

  - 随机日期生成 (`randomDate`)
  - 随机时间戳生成 (`randomTimestamp`)
  - 支持自定义日期范围

- 👥 **完整用户信息生成**
  - 生成包含所有信息的随机用户对象 (`generateRandomUser`)
  - 包含 ID、姓名、邮箱、电话、地址、头像、生日、活跃状态、分数、余额等字段

### 技术特性

- ✅ 支持所有 Flutter 平台（Android、iOS、Web、Windows、macOS、Linux）
- 🏗️ 模块化架构设计，代码组织清晰
- 📦 纯 Dart 实现，无需原生代码依赖
- 🔧 易于使用的 API 接口
- 📚 完整的示例应用
- 📖 详细的文档说明

### 文档

- 📝 完整的 README.md 文档
- 🎯 详细的 API 使用示例
- 🚀 快速开始指南
- 📱 示例应用演示

### 开发工具

- 🧪 基础测试框架
- 📋 代码规范检查
- 🔄 持续集成配置

---

## 版本说明

- **[新增]** - 新功能
- **[更改]** - 现有功能的更改
- **[弃用]** - 即将删除的功能
- **[移除]** - 已删除的功能
- **[修复]** - 错误修复
- **[安全]** - 安全相关的更改

## 链接

- [GitHub 仓库](https://github.com/pei-duo/random_toolkit.git)
- [pub.dev 包页面](https://pub.dev/packages/random_toolkit)
- [问题反馈](https://github.com/pei-duo/random_toolkit/issues)
