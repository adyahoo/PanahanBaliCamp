part of 'pages.dart';

class SuccessResetPassPage extends StatelessWidget {
  const SuccessResetPassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
          title: "Yeay!!",
          subtitle: "Password Anda Sudah Berhasil Diubah",
          image: "food_wishes.png",
          titleButton1: "Masuk",
          buttonTap1: () {
            Get.offAll(SignInPage());
          }),
    );
  }
}
