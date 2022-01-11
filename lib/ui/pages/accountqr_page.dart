part of 'pages.dart';

class AccountqrPage extends StatefulWidget {
  const AccountqrPage({Key? key}) : super(key: key);

  @override
  _AccountqrPageState createState() => _AccountqrPageState();
}

class _AccountqrPageState extends State<AccountqrPage> {
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
        title: "Qr Account",
        subtitle: "Kegiatan Archery kamu",
        onBackButtonPressed: () {
          Get.back();
        },
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 121, horizontal: 52),
            child: Image.asset(
                "assets/images/qrcode.png",
                width: 256,
                height: 256
            )
        )
    );
  }
}
