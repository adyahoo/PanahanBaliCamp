part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: Container(
              color: greyColorBody,
            ),
          ),
          SafeArea(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              children: [
                HomePage(),
                ArcherPage(),
                IllustrationPage(
                  title: "Order Berhasil Dibuat",
                  subtitle: "Silahkan cek status pemesanan\nuntuk memastikan proses",
                  image: "illustration_img.png",
                  titleButton1: "Beli Lagi",
                  buttonTap1: () {},
                  titleButton2: "Lihat Pesanan",
                  buttonTap2: () {},
                ),
                ProfilePage(),
              ],
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavbar(
              selectedIndex: selectedPage,
              onTap: (index) {
                setState(() {
                  selectedPage = index;
                  pageController.jumpToPage(selectedPage);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

