import 'dart:io';

import 'package:flutter/material.dart';
import 'package:presence/common/custom_icons_icons.dart';
import 'package:presence/common/app_constants.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrCodePage extends StatefulWidget {
  const ScanQrCodePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScanQrCodePage();
}

class _ScanQrCodePage extends State<ScanQrCodePage> {
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
      backgroundColor: AppConstants.neutral_900,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Head
            Container(
              color: AppConstants.white,
              padding: const EdgeInsets.symmetric(
                  vertical: AppConstants.spacing * 2,
                  horizontal: AppConstants.spacing * 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      CustomIcons.arrowleft,
                      size: AppConstants.spacing * 3,
                      color: AppConstants.neutral_900,
                    ),
                  ),
                  Text(
                    'Scan Qr Code',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      CustomIcons.info,
                      size: AppConstants.spacing * 3,
                      color: AppConstants.neutral_900,
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
          vertical: AppConstants.spacing * 3,
          horizontal: AppConstants.spacing * 2,
        ),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              toggleFlash();
            });
          },
          child: Icon(
            CustomIcons.flash,
            size: AppConstants.spacing * 3,
            color: isFlashOn == true
                ? AppConstants.warning_400
                : AppConstants.neutral_900,
          ),
          backgroundColor: AppConstants.white,
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
          borderColor: AppConstants.secondary_400,
          borderRadius: AppConstants.spacing,
          borderLength: AppConstants.spacing * 4,
          borderWidth: AppConstants.spacing,
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
