import 'dart:io';

import 'package:flutter/material.dart';
import 'package:presence/service/custom_icons_icons.dart';
import 'package:presence/service/global_data.dart';
import 'package:presence/text/paragraph.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScanQrCode();
}

class _ScanQrCode extends State<ScanQrCode> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalData.neutral_900,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Head
            Container(
              color: GlobalData.white,
              padding: const EdgeInsets.symmetric(
                  vertical: GlobalData.spacing * 2,
                  horizontal: GlobalData.spacing * 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      CustomIcons.arrowleft,
                      size: GlobalData.spacing * 3,
                      color: GlobalData.neutral_900,
                    ),
                  ),
                  const Paragraph(
                    title: 'Scan Qr Code',
                    size: 1,
                    color: GlobalData.neutral_900,
                    weight: FontWeight.w500,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      CustomIcons.info,
                      size: GlobalData.spacing * 3,
                      color: GlobalData.neutral_900,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ))
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
