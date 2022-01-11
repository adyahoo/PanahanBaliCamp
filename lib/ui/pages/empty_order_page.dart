part of 'pages.dart';

class EmptyOrderPage extends StatelessWidget {
  const EmptyOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: IllustrationPage(
            title: "Ouch!",
            subtitle: "Sepertinya kamu\nbelum pernah order",
            image: "illustration_img.png",
            titleButton1: "Beli Product",
            buttonTap1: () {
              Get.to(MainPage());
            }));
  }
}
