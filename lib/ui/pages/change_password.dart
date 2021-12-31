part of 'pages.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController passController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Lupa Kata Sandi",
      subtitle: "Reset kata sandi akun anda",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 160, defaultMargin, 6),
            child: Text("Kata Sandi", style: blackFontStyle2),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: passController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: "Masukan Kata Sandi Reset",
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 12, defaultMargin, 6),
            child: Text("Kata Sandi Baru", style: blackFontStyle2),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: passController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: "Masukan Kata Sandi Baru",
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 12, defaultMargin, 6),
            child: Text("Konfirmasi Kata Sandi Baru", style: blackFontStyle2),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: passController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: "Masukan Kata Sandi Baru Kembali",
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: EdgeInsets.fromLTRB(defaultMargin, 24, defaultMargin, 0),
            child: RaisedButton(
              color: mainColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text("Simpan", style: blackFontStyle3.copyWith(fontWeight: FontWeight.bold)),
              onPressed: () {},
            ),
          ),
        ]
      )
    );
  }
}
