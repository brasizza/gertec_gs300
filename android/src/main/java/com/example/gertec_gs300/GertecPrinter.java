package com.example.gertec_gs300;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.Context;
import android.graphics.Bitmap;
import android.util.Log;

import com.elotouch.AP80.sdkhelper.AP80PrintHelper;

import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Set;
import java.util.UUID;

public class GertecPrinter {

    private Context context;
    private AP80PrintHelper printer;
    private BluetoothSocket socket;
    private BluetoothSocket bluetoothSocket;
    private static final UUID PRINTER_UUID = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB");

    private static final String Innerprinter_Address = "11:22:33:44:55:66";

    private static BluetoothAdapter getBTAdapter() {
        return BluetoothAdapter.getDefaultAdapter();
    }

    private static BluetoothDevice getDevice(BluetoothAdapter bluetoothAdapter) {
        BluetoothDevice innerprinter_device = null;
        Set<BluetoothDevice> devices = bluetoothAdapter.getBondedDevices();
        for (BluetoothDevice device : devices) {
            if (device.getAddress().equals(Innerprinter_Address)) {
                innerprinter_device = device;
                break;
            }
        }
        return innerprinter_device;
    }





    private  BluetoothSocket getSocket(BluetoothDevice device) throws IOException {
        if(socket != null) {
            if (socket.isConnected()) {
                socket.close();
            }
        }
        socket = device.createRfcommSocketToServiceRecord(PRINTER_UUID);
        socket.connect();
        return socket;
    }


    public GertecPrinter(Context context, AP80PrintHelper printer) {
        this.context = context;
        this.printer = printer;
        this.printer.initPrint(context);





    }

    private void connectBluetooth() {
        try {
             BluetoothDevice device = getDevice(getBTAdapter());//Obter adaptador Bluetooth
             bluetoothSocket = getSocket(device);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void commitPrinter(){
        this.printer.printStart();
    }
    public void printText(HashMap map){
        String printText = (String) map.get("text");
        Log.d("printText - input", map.toString());
        int fontSize = map.get("fontSize") != null ? (int) map.get("fontSize") : 32;
        int textType =  (map.get("bold") != null ? (boolean) map.get("bold") : false) == true ? 1 : 0;
        boolean  underline = map.get("underline") != null ? (boolean) map.get("underline") : false;
        int  alignText = map.get("align") != null ? (int) map.get("align") : 0;

        int paper = map.get("paper") != null ? (int) map.get("paperSize") : 80;
        this.printer.printData(printText, fontSize, textType, underline, alignText, paper, 0);
        commitPrinter();
    }

    public void wrapLine(int times) {
        this.printer.lineFeed(times);
        commitPrinter();
    }

    public void printQRcode(String textQrcode, int size, int align) {
        Log.d("printQRcode" , "textQrcode - " + textQrcode);
        Log.d("printQRcode" , "size - " + size);
        Log.d("printQRcode" , "align - " + align);
        this.printer.printQRCode(textQrcode,size,align);
        commitPrinter();

    }

    public void printImage(Bitmap image, int alignImage, int size) {

        this.printer.printBitmap(image ,alignImage , size);
        commitPrinter();
    }

    public void printBarCode(String textBC, int typeBC, int widthBC, int heightBC, int alignBC, int textPositionBC) {
        this.printer.printBarCode(textBC,typeBC,widthBC,heightBC,alignBC,textPositionBC);
        commitPrinter();
    }

    public int printRaw(byte[] data) {
        connectBluetooth();


        try {
            sendData(data);
            commitPrinter();
        }catch(Exception e){
            Log.d("printRaw", e.toString());
        }
        return 1;
    }

    public  void sendData(byte[] bytes) {
        if (bluetoothSocket != null) {
            OutputStream out = null;
            try {
                out = bluetoothSocket.getOutputStream();
                out.write(bytes, 0, bytes.length);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{

        }
    }

    public int cutPaper(int cut) {
        this.printer.cutPaper(2);
        commitPrinter();

        return 1;
    }

    public int getPrinterState() {
       return  this.printer.getPrinterState(this.context);
    }
}
