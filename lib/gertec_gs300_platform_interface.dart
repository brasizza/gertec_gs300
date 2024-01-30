import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'core/helpers/constants.dart';
import 'core/helpers/models/gertec_text.dart';
import 'gertec_gs300_method_channel.dart';

abstract class GertecGs300Platform extends PlatformInterface {
  /// Constructs a GertecGs300Platform.
  GertecGs300Platform() : super(token: _token);

  static final Object _token = Object();

  static GertecGs300Platform _instance = MethodChannelGertecGs300();

  /// The default instance of [GertecGs300Platform] to use.
  ///
  /// Defaults to [MethodChannelGertecGs300].
  static GertecGs300Platform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GertecGs300Platform] when
  /// they register themselves.
  static set instance(GertecGs300Platform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> printText(GertecText textObject) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> wrapLine(int lines) {
    throw UnimplementedError('wrapLine() has not been implemented.');
  }

  Future<String?> cutPaper(CutPaperType type) {
    throw UnimplementedError('cutPaper() has not been implemented.');
  }

  Future<String?> printRaw(Uint8List data) {
    throw UnimplementedError('printRaw() has not been implemented.');
  }

  Future<String?> printBarCode(
      {required int width,
      required int height,
      required String text,
      required int align,
      required int type,
      required int position}) {
    throw UnimplementedError('printBarCode() has not been implemented.');
  }

  Future<String?> printQrcode(
      {required int width, required int align, required String text}) {
    throw UnimplementedError('printQrcode() has not been implemented.');
  }

  Future<String?> printImage(Uint8List image, int align, int paper) {
    throw UnimplementedError('printImage() has not been implemented.');
  }

  Future<String?> printerState() async {
    throw UnimplementedError('printerState() has not been implemented.');
  }
}
