part of 'pages.dart';

class ScanqrPage extends StatefulWidget {
  const ScanqrPage({Key? key}) : super(key: key);

  @override
  _ScanqrPageState createState() => _ScanqrPageState();
}

class _ScanqrPageState extends State<ScanqrPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

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
    return GeneralPage(
      title: "Attendance",
      subtitle: "Kegiatan Archery kamu",
      onBackButtonPressed: () {
        Get.back();
      },
      backColor: greyColorBody,
      child: Column(children: [
        Container(
          width: double.infinity,
          height: 360,
          padding: EdgeInsets.all(defaultMargin),
          color: Colors.white,
          alignment: Alignment.center,
          child: _buildQrView(context)
        ),
        SizedBox(height: 35),
        Container(
          alignment: Alignment.center,
          child: (result != null)
              ? Text("Result: ${result!.code}")
              : Text("Please Scan the Barcode"),
        ),
        SizedBox(height: 35),
        Container(
            width: double.infinity,
            padding:
                EdgeInsets.symmetric(vertical: 16, horizontal: defaultMargin),
            color: Colors.white,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Record Attendance", style: blackFontStyle3),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 12)),
                backgroundColor: MaterialStateProperty.all(mainColor),
              ),
            )),
      ]),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: mainColor,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    // log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
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
