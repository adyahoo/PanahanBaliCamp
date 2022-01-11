part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  const SuccessOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
          title: "Order Berhasil Dibuat",
          subtitle: "Silahkan cek status pemesanan\nuntuk memastikan proses",
          image: "illustration_img.png",
          titleButton1: "Beli Lagi",
          buttonTap1: () {
            Get.offAll(MainPage());
          },
        titleButton2: "Lihat Pesanan",
        buttonTap2: () {
            Get.snackbar("Lihat Pesanan", "Menuju Halaman List Pesanan");
        },
      ),
    );
  }
}
