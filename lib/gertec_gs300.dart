import 'dart:typed_data';

// import 'package:flutter_blue_elves/flutter_blue_elves.dart';
import 'package:gertec_gs300/core/helpers/constants.dart';
import 'package:gertec_gs300/core/helpers/models/gertec_response.dart';
import 'package:gertec_gs300/core/helpers/models/gertec_text.dart';

import 'gertec_gs300_platform_interface.dart';

class GertecGs300 {
  Future<GertecResponse> getPlatformVersion() async {
    final plat = await GertecGs300Platform.instance.getPlatformVersion();
    return GertecResponse.fromJson(plat ?? '{}');
  }

  /// Prints the provided text.
  Future<GertecResponse> printText(GertecText textObject) async {
    return GertecResponse.fromJson(await GertecGs300Platform.instance.printText(textObject) ?? '{}');
  }

  /// Cuts the paper based on the provided cut type.
  Future<GertecResponse> cutPaper(CutPaperType type) async {
    return GertecResponse.fromJson(await GertecGs300Platform.instance.cutPaper(type) ?? '{}');
  }

  /// Prints raw data.
  Future<GertecResponse> printRaw(Uint8List data) async {
    // final state = await FlutterBlueElves.instance.androidCheckBlueLackWhat();

    // if (state.contains(AndroidBluetoothLack.bluetoothFunction)) {
    //   FlutterBlueElves.instance.androidOpenBluetoothService((isOk) async {
    //     if (isOk) {
    //       return GertecResponse.fromJson(
    //           await GertecGs300Platform.instance.printRaw(data) ?? '{}');
    //     } else {
    //       return GertecResponse(
    //           message: 'Falha bluetooth', success: false, content: '');
    //     }
    //   });
    // } else {
    //   return GertecResponse.fromJson(
    //       await GertecGs300Platform.instance.printRaw(data) ?? '{}');
    // }
    return GertecResponse(message: 'Falha bluetooth', success: false, content: '');
  }

  Future<GertecResponse> printBarCode({
    int width = 200,
    int height = 60,
    required String text,
    PrintAlign align = PrintAlign.LEFT,
    BarCodeType type = BarCodeType.BARCODE_TYPE_JAN13,
    BarCodeTextPosition textPostion = BarCodeTextPosition.TEXT_NONE,
  }) async {
    return GertecResponse.fromJson(await GertecGs300Platform.instance.printBarCode(width: width, height: height, text: text, align: align.value, type: type.value, position: textPostion.value) ?? '{}');
  }

  /// Prints a QR code with the provided parameters.
  Future<GertecResponse> printQrcode({
    int width = 100,
    int align = 0,
    required String text,
  }) async {
    return GertecResponse.fromJson(await GertecGs300Platform.instance.printQrcode(
          width: width,
          align: align,
          text: text,
        ) ??
        '{}');
  }

  /// Prints an image with the provided parameters.
  Future<GertecResponse> printImage({
    required Uint8List image,
    PrintAlign align = PrintAlign.LEFT,
    required GertecPaperSize paper,
  }) async {
    return GertecResponse.fromJson(await GertecGs300Platform.instance.printImage(
          image,
          align.value,
          paper.value,
        ) ??
        '{}');
  }

  /// Retrieves the state of the printer.
  Future<GertecResponse> printerState() async {
    final state = GertecResponse.fromJson(await GertecGs300Platform.instance.printerState() ?? '{}');
    final printerState = PrinterState.values.where((element) => element.value == (state.content as int));

    return state.copyWith(content: (printerState.isNotEmpty ? printerState.first : PrinterState.PRINTER_STATE_UNKNOWN));
  }

  /// Wraps the line by the specified number of lines.
  Future<void> wrap({
    int len = 1,
  }) async {
    await GertecGs300Platform.instance.wrapLine(len);
  }

  /// Prints a line with the specified character and length.
  Future<void> line({
    String ch = '-',
    int len = 80,
  }) async {
    await GertecGs300Platform.instance.printText(GertecText(text: List.filled(len, ch[0]).join()));
  }
}
