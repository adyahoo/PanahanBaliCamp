part of 'pages.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Lupa Kata Sandi",
      subtitle: "Reset kata sandi akun anda",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text("Alamat Email", style: blackFontStyle2),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: "Masukan Alamat Email",
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: EdgeInsets.fromLTRB(defaultMargin, 265, defaultMargin, 12),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
              color: mainColor,
              child: Text("Kirim Email Reset", style: blackFontStyle3.copyWith(fontWeight: FontWeight.bold)),
              onPressed: () {},
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
              color: secondColor,
              child: Text("Masuk", style: blackFontStyle3.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
