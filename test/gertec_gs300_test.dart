import 'package:flutter_test/flutter_test.dart';
import 'package:gertec_gs300/gertec_gs300.dart';
import 'package:gertec_gs300/gertec_gs300_platform_interface.dart';
import 'package:gertec_gs300/gertec_gs300_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGertecGs300Platform
    with MockPlatformInterfaceMixin
    implements GertecGs300Platform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GertecGs300Platform initialPlatform = GertecGs300Platform.instance;

  test('$MethodChannelGertecGs300 is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGertecGs300>());
  });

  test('getPlatformVersion', () async {
    GertecGs300 gertecGs300Plugin = GertecGs300();
    MockGertecGs300Platform fakePlatform = MockGertecGs300Platform();
    GertecGs300Platform.instance = fakePlatform;

    expect(await gertecGs300Plugin.getPlatformVersion(), '42');
  });
}
