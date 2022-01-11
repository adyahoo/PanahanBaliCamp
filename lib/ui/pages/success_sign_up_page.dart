part of 'pages.dart';

class SuccessSignUpPage extends StatelessWidget {
  const SuccessSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
          title: "Yeay!",
          subtitle: "Kamu telah terdaftar\nCek email untuk verifikasi akun",
          image: "food_wishes.png",
          titleButton1: "Masuk",
          buttonTap1: () {
            Get.offAll(SignInPage());
          }),
    );
  }
}
