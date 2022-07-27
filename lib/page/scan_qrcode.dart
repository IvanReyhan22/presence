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
  bool isFlashOn = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
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
              child: InkWell(
                onTap: () => controller!.resumeCamera(),
                child: _buildQrView(context),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: GlobalData.spacing * 3,
          horizontal: GlobalData.spacing * 2,
        ),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              toggleFlash();
            });
          },
          child: Icon(
            CustomIcons.flash,
            size: GlobalData.spacing * 3,
            color: isFlashOn == true
                ? GlobalData.warning_400
                : GlobalData.neutral_900,
          ),
          backgroundColor: GlobalData.white,
        ),
      ),
    );
  }

  void toggleFlash() async {
    setState(() {
      isFlashOn = !isFlashOn;
    });
    await controller?.toggleFlash();
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = MediaQuery.of(context).size.width * 0.8;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: GlobalData.secondary_400,
          borderRadius: GlobalData.spacing,
          borderLength: GlobalData.spacing * 4,
          borderWidth: GlobalData.spacing,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
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

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
