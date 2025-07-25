import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_toolkit/random_toolkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  String _platformVersion = 'Unknown';

  // 随机数据展示
  String _randomData = '';
  Color _randomColor = Colors.blue;
  late TabController _tabController;

  String lastButtonType = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    initPlatformState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await RandomToolkit.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  void _generateRandomData(String type) {
    setState(() {
      switch (type) {
        // 基础随机数据 - 新旧API共存
        case 'int':
          _randomData = '随机整数: ${RandomToolkit.generators.randomInt(1, 100)}';
          break;
        case 'double':
          _randomData =
              '随机浮点数: ${RandomToolkit.generators.randomDouble(0.0, 100.0).toStringAsFixed(2)}';
          break;
        case 'bool':
          _randomData = '随机布尔值: ${RandomToolkit.generators.randomBool()}';
          break;
        case 'string':
          _randomData = '随机字符串: ${RandomToolkit.generators.randomString(10)}';
          break;
        case 'string_symbols':
          _randomData =
              '带符号字符串: ${RandomToolkit.generators.randomString(8, includeSymbols: true)}';
          break;
        case 'uuid':
          _randomData = '随机UUID: ${RandomToolkit.generators.randomUUID()}';
          break;

        // 个人信息 - 新旧API对比
        case 'name_cn':
          _randomData =
              '中文姓名: ${RandomToolkit.person.randomName(chinese: true)}';
          break;
        case 'name_en':
          _randomData =
              '英文姓名: ${RandomToolkit.person.randomName(chinese: false)}';
          break;
        case 'email':
          _randomData = '随机邮箱: ${RandomToolkit.person.randomEmail()}';
          break;
        case 'phone_cn':
          _randomData =
              '中国手机号: ${RandomToolkit.person.randomPhoneNumber(countryCode: 'CN')}';
          break;
        case 'phone_us':
          _randomData =
              '美国电话: ${RandomToolkit.person.randomPhoneNumber(countryCode: 'US')}';
          break;

        // 视觉元素 - 新API优先
        case 'color':
          _randomColor = RandomToolkit.visual.randomColor();
          _randomData = '随机颜色: ${RandomToolkit.visual.randomHexColor()}';
          break;
        case 'material_color':
          _randomColor = RandomToolkit.visual.randomMaterialColor();
          _randomData = 'Material颜色: ${_randomColor.toString()}';
          break;
        case 'image_url':
          _randomData =
              RandomToolkit.visual.randomImageUrl(width: 600, height: 250);
          break;
        case 'avatar':
          _randomData = RandomToolkit.visual.randomAvatarUrl();
          break;

        // 地理位置 - 新API
        case 'address_cn':
          _randomData =
              '中文地址: ${RandomToolkit.location.randomAddress(chinese: true)}';
          break;
        case 'address_en':
          _randomData =
              '英文地址: ${RandomToolkit.location.randomAddress(chinese: false)}';
          break;

        // 日期时间 - 新API
        case 'date':
          _randomData =
              '随机日期: ${RandomToolkit.dateTime.randomDate().toString().split(' ')[0]}';
          break;
        case 'timestamp':
          _randomData = '随机时间戳: ${RandomToolkit.dateTime.randomTimestamp()}';
          break;

        // 完整用户信息 - 新API
        case 'user_cn':
          final user = RandomToolkit.user.generate(chinese: true);
          _randomData = '''完整用户信息(中文):
ID: ${user['id']}
姓名: ${user['name']}
邮箱: ${user['email']}
电话: ${user['phone']}
地址: ${user['address']}
生日: ${user['birthDate']?.split('T')[0]}
活跃状态: ${user['isActive']}
积分: ${user['score']}
余额: ¥${user['balance']}''';
          break;
        case 'user_en':
          final user = RandomToolkit.user.generate(chinese: false);
          _randomData = '''Complete User Info (English):
ID: ${user['id']}
Name: ${user['name']}
Email: ${user['email']}
Phone: ${user['phone']}
Address: ${user['address']}
Birth Date: ${user['birthDate']?.split('T')[0]}
Active: ${user['isActive']}
Score: ${user['score']}
Balance: \$${user['balance']}''';
          break;
      }
      lastButtonType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Random Toolkit Demo'),
          backgroundColor: _randomColor,
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: const [
              Tab(text: '基础数据'),
              Tab(text: '个人信息'),
              Tab(text: '视觉元素'),
              Tab(text: '地理位置'),
              Tab(text: '日期时间'),
              Tab(text: '完整用户'),
            ],
          ),
        ),
        body: Column(
          children: [
            // 结果显示区域
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
                color: _randomColor.withOpacity(0.1),
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 120,
                    child: SingleChildScrollView(
                      child: Text(
                        _randomData.isEmpty ? '点击下方按钮生成随机数据' : _randomData,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  if (lastButtonType == 'image_url' ||
                      lastButtonType == 'avatar') ...[
                    const SizedBox(height: 6),
                    Image.network(_randomData, width: 120, height: 120),
                  ],
                ],
              ),
            ),

            // 功能选项卡
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // 基础数据
                  _buildButtonGrid([
                    _ButtonData('随机整数', 'int'),
                    _ButtonData('随机浮点数', 'double'),
                    _ButtonData('随机布尔值', 'bool'),
                    _ButtonData('随机字符串', 'string'),
                    _ButtonData('带符号字符串', 'string_symbols'),
                    _ButtonData('随机UUID', 'uuid'),
                  ]),

                  // 个人信息
                  _buildButtonGrid([
                    _ButtonData('中文姓名', 'name_cn'),
                    _ButtonData('英文姓名', 'name_en'),
                    _ButtonData('随机邮箱', 'email'),
                    _ButtonData('中国手机号', 'phone_cn'),
                    _ButtonData('美国电话', 'phone_us'),
                  ]),

                  // 视觉元素
                  _buildButtonGrid([
                    _ButtonData('随机颜色', 'color'),
                    _ButtonData('Material颜色', 'material_color'),
                    _ButtonData('随机图片', 'image_url'),
                    _ButtonData('随机头像', 'avatar'),
                  ]),

                  // 地理位置
                  _buildButtonGrid([
                    _ButtonData('中文地址', 'address_cn'),
                    _ButtonData('英文地址', 'address_en'),
                  ]),

                  // 日期时间
                  _buildButtonGrid([
                    _ButtonData('随机日期', 'date'),
                    _ButtonData('随机时间戳', 'timestamp'),
                  ]),

                  // 完整用户
                  _buildButtonGrid([
                    _ButtonData('中文用户', 'user_cn'),
                    _ButtonData('英文用户', 'user_en'),
                  ]),
                ],
              ),
            ),

            // 平台信息
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              color: Colors.grey[100],
              child: Text(
                '运行平台: $_platformVersion',
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonGrid(List<_ButtonData> buttons) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2.5,
        ),
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          final button = buttons[index];
          return ElevatedButton(
            onPressed: () => _generateRandomData(button.type),
            style: ElevatedButton.styleFrom(
              backgroundColor: _randomColor.withOpacity(0.8),
              foregroundColor: Colors.white,
            ),
            child: Text(
              button.title,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}

class _ButtonData {
  final String title;
  final String type;

  _ButtonData(this.title, this.type);
}
