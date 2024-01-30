package com.example.gertec_gs300;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.RemoteException;
import android.util.Log;

import androidx.annotation.NonNull;


import com.elotouch.AP80.sdkhelper.AP80PrintHelper;

import java.io.ByteArrayInputStream;
import java.util.HashMap;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;


/** GertecGs300Plugin */
public class GertecGs300Plugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private GertecPrinter printer;



  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    Context context = flutterPluginBinding.getApplicationContext();
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "gertec/gs300");
    channel.setMethodCallHandler(this);
    printer = new GertecPrinter(context,AP80PrintHelper.getInstance());


  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    Log.d("FLUTTER", "Calling: " + call.method );

    switch (call.method) {
      default:
        Log.d("GertecGs300Plugin", "Method not implemented: " + call.method);
        result.notImplemented();
      case "getPlatformVersion":
        result.success(new ReturnObject("OK", "Android " + android.os.Build.VERSION.RELEASE, true).toJson());
        break;

      case "WRAP_LINE":
        int times = call.argument("lines");

          printer.wrapLine(times);
          result.success(new ReturnObject("OK", 1, true).toJson());

        break;


      case "PRINT_QRCODE":
        int widthQR = call.argument("width");
        int alignQR = call.argument("align");
        String textQrcode = call.argument("text");
          printer.printQRcode(textQrcode, widthQR, alignQR);
          result.success(new ReturnObject("OK", 1, true).toJson());

        break;


      case "PRINT_IMAGE":
        byte[] dataImage = (byte[]) call.argument("data");
        int alignImage = call.argument("align");
        int paperSize = call.argument("paper");
        Bitmap image = byteArrayToBitmap(dataImage);

          printer.printImage(image, alignImage, paperSize);
          result.success(new ReturnObject("OK", 1, true).toJson());


        break;


      case "PRINT_BARCODE":
        int typeBC = call.argument("barcode_type");
        int bcTextPosition = call.argument("barcode_text_position");
        int widthBC = call.argument("width");
        int heightBC = call.argument("height");
        int alignBC = call.argument("align");
        String textBC = call.argument("text");

          printer.printBarCode(textBC, typeBC, widthBC, heightBC, alignBC,bcTextPosition);
          result.success(new ReturnObject("OK", 1, true).toJson());

        break;

      case "PRINT_RAW":
        byte[] data = (byte[]) call.argument("data");
        Log.d("PRINT_RAW", String.valueOf(data));
          int resultBuf = printer.printRaw(data);
          result.success(new ReturnObject("OK", resultBuf, true).toJson());

        break;

      case "CUT_PAPER":
        int cut = call.argument("cut");
          int resultCut = printer.cutPaper(cut);
          result.success(new ReturnObject("OK", resultCut, true).toJson());

        break;

      case "PRINTER_STATE":
        int state = 0;
          state = printer.getPrinterState();
          Log.d("PRINTER_STATE" , String.valueOf(state));
          result.success(new ReturnObject("OK", state, true).toJson());


        break;

      case "PRINT_TEXT":
        HashMap map = call.argument("args");
          printer.printText(map);
          result.success(new ReturnObject("OK", "", true).toJson());

        break;
    }
  }

  public Bitmap byteArrayToBitmap(byte[] byteArray) {

    ByteArrayInputStream inputStream = new ByteArrayInputStream(byteArray);
    return BitmapFactory.decodeStream(inputStream);
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }


}
