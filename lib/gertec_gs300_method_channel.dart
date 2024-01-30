import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:gertec_gs300/core/helpers/constants.dart';
import 'package:gertec_gs300/core/helpers/models/gertec_text.dart';

import 'gertec_gs300_platform_interface.dart';

/// An implementation of [GertecGs300Platform] that uses method channels.
class MethodChannelGertecGs300 extends GertecGs300Platform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('gertec/gs300');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> printText(GertecText textObject) async {
    final version = await methodChannel.invokeMethod<String>('PRINT_TEXT', {'args': textObject.toMap()});
    return version;
  }

  @override
  Future<void> wrapLine(int lines) async {
    await methodChannel.invokeMethod<String?>('WRAP_LINE', {"lines": lines});
  }

  @override
  Future<String?> cutPaper(CutPaperType type) async {
    return await methodChannel.invokeMethod('CUT_PAPER', {"cut": type.value});
  }

  @override
  Future<String?> printQrcode({required int width, required int align, required String text}) async {
    return await methodChannel.invokeMethod('PRINT_QRCODE', {"width": width, 'align': align, 'text': text});
  }

  @override
  Future<String?> printBarCode({required int width, required int height, required String text, required int align, required int type, required int position}) async {
    return await methodChannel.invokeMethod('PRINT_BARCODE', {'width': width, 'height': height, 'text': text, 'align': align, 'barcode_type': type, 'barcode_text_position': position});
  }

  @override
  Future<String?> printImage(Uint8List image, int align, int paper) async {
    Map<String, dynamic> arguments = <String, dynamic>{"data": image, 'align': align, 'paper': paper};

    return await methodChannel.invokeMethod('PRINT_IMAGE', arguments);
  }

  @override
  Future<String?> printRaw(Uint8List data) async {
    Map<String, dynamic> arguments = <String, dynamic>{"data": data};

    return await methodChannel.invokeMethod('PRINT_RAW', arguments);
  }

  @override
  Future<String?> printerState() async {
    return await methodChannel.invokeMethod('PRINTER_STATE');
  }
}
