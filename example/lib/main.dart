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

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _randomToolkitPlugin = RandomToolkit();
  
  // 随机数据展示
  String _randomData = '';
  Color _randomColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await _randomToolkitPlugin.getPlatformVersion() ?? 'Unknown platform version';
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
        case 'number':
          _randomData = '随机数字: ${RandomToolkit.randomInt(1, 100)}';
          break;
        case 'string':
          _randomData = '随机字符串: ${RandomToolkit.randomString(10)}';
          break;
        case 'name':
          _randomData = '随机姓名: ${RandomToolkit.randomName()}';
          break;
        case 'email':
          _randomData = '随机邮箱: ${RandomToolkit.randomEmail()}';
          break;
        case 'phone':
          _randomData = '随机电话: ${RandomToolkit.randomPhoneNumber()}';
          break;
        case 'address':
          _randomData = '随机地址: ${RandomToolkit.randomAddress()}';
          break;
        case 'color':
          _randomColor = RandomToolkit.randomColor();
          _randomData = '随机颜色: ${RandomToolkit.randomHexColor()}';
          break;
        case 'user':
          final user = RandomToolkit.randomUser();
          _randomData = '随机用户:\n姓名: ${user['name']}\n邮箱: ${user['email']}\n电话: ${user['phone']}';
          break;
        case 'uuid':
          _randomData = '随机UUID: ${RandomToolkit.randomUUID()}';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Random Toolkit Demo'),
          backgroundColor: _randomColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('运行平台: $_platformVersion'),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                  color: _randomColor.withOpacity(0.1),
                ),
                child: Text(
                  _randomData.isEmpty ? '点击下方按钮生成随机数据' : _randomData,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.5,
                  children: [
                    _buildButton('随机数字', 'number'),
                    _buildButton('随机字符串', 'string'),
                    _buildButton('随机姓名', 'name'),
                    _buildButton('随机邮箱', 'email'),
                    _buildButton('随机电话', 'phone'),
                    _buildButton('随机地址', 'address'),
                    _buildButton('随机颜色', 'color'),
                    _buildButton('随机用户', 'user'),
                    _buildButton('随机UUID', 'uuid'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildButton(String title, String type) {
    return ElevatedButton(
      onPressed: () => _generateRandomData(type),
      child: Text(title, style: const TextStyle(fontSize: 12)),
    );
  }
}
