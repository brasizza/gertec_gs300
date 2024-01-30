import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:gertec_gs300/core/helpers/constants.dart';
import 'package:gertec_gs300/core/helpers/models/gertec_text.dart';
import 'package:gertec_gs300/gertec_gs300.dart';
import 'package:gertec_gs300/gertec_gs300_method_channel.dart';
import 'package:gertec_gs300/gertec_gs300_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGertecGs300Platform with MockPlatformInterfaceMixin implements GertecGs300Platform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> cutPaper(CutPaperType type) async {
    return '';
  }

  @override
  Future<String?> printBarCode({required int width, required int height, required String text, required int align, required int type, required int position}) async {
    return '';
  }

  @override
  Future<String?> printImage(Uint8List image, int align, int paper) async {
    return '';
  }

  @override
  Future<String?> printQrcode({required int width, required int align, required String text}) async {
    return '';
  }

  @override
  Future<String?> printRaw(Uint8List data) async {
    return '';
  }

  @override
  Future<String?> printText(GertecText textObject) async {
    return '';
  }

  @override
  Future<String?> printerState() async {
    return '';
  }

  @override
  Future<void> wrapLine(int lines) async {}
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
