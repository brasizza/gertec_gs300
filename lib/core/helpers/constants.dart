// ignore_for_file: constant_identifier_names

enum GertecPaperSize {
  PAPER_80(80),
  PAPER_58(58);

  const GertecPaperSize(this.value);
  final int value;
}

enum BarCodeType {
  BARCODE_TYPE_UPCA(0),
  BARCODE_TYPE_UPCE(1),
  BARCODE_TYPE_JAN13(2),
  BARCODE_TYPE_JAN8(3),
  BARCODE_TYPE_CODE39(4),
  BARCODE_TYPE_ITF(5),
  BARCODE_TYPE_CODEBAR(6),
  BARCODE_TYPE_CODE93(7),
  BARCODE_TYPE_CODE128(8);

  const BarCodeType(this.value);
  final int value;
}

enum BarCodeTextPosition {
  TEXT_NONE(0),
  TEXT_UPPER(1),
  TEXT_LOWER(2),
  TEXT_BOTH(3);

  const BarCodeTextPosition(this.value);
  final int value;
}

enum PrintAlign {
  LEFT(0),
  CENTER(1),
  RIGHT(2);

  final int value;
  const PrintAlign(this.value);
}

enum CutPaperType {
  HALF(50),
  FULL(100);

  final int value;
  const CutPaperType(this.value);
}

enum PrinterState {
  PRINTER_STATE_NORMAL(1),
  // PRINTER_STATE_NOPAPER(1),
  // PRINTER_STATE_HIGHTEMP(2),
  PRINTER_STATE_UNKNOWN(3),
  PRINTER_STATE_NOPAPER(4);
  // PRINTER_STATE_DEV_ERROR(5),
  // PRINTER_STATE_LOWVOL_ERROR(6),
  // PRINTER_STATE_BUSY(7),
  // PRINTER_STATE_CUT(8),
  // PRINTER_STATE_OUT(9),
  // PRINTER_PAPER_RUN_OUT(10),
  // PRINTER_COVER_OPEN(11),
  // PRINT_ERROR_PARAMETER(12);

  const PrinterState(this.value);
  final int value;
}

enum FontSize {
  SMALL(16),
  NORMAL(20),
  LARGE(30),
  XLARGE(40);

  final int value;
  const FontSize(this.value);
}
