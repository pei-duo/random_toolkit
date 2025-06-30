import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_toolkit/random_toolkit_method_channel.dart';

void main() {
  MethodChannelRandomToolkit platform = MethodChannelRandomToolkit();
  const MethodChannel channel = MethodChannel('random_toolkit');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
