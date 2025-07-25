import 'package:flutter_test/flutter_test.dart';
import 'package:random_toolkit/random_toolkit.dart';
import 'package:random_toolkit/random_toolkit_platform_interface.dart';
import 'package:random_toolkit/random_toolkit_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockRandomToolkitPlatform
    with MockPlatformInterfaceMixin
    implements RandomToolkitPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final RandomToolkitPlatform initialPlatform = RandomToolkitPlatform.instance;

  test('$MethodChannelRandomToolkit is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelRandomToolkit>());
  });

  test('getPlatformVersion', () async {
    MockRandomToolkitPlatform fakePlatform = MockRandomToolkitPlatform();
    RandomToolkitPlatform.instance = fakePlatform;

    expect(await RandomToolkit.getPlatformVersion(), '42');
  });
}
