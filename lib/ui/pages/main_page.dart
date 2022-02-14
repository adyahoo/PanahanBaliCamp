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
    context.bloc<ArcherCubit>().getArchers();
    context.bloc<JadwalCubit>().getJadwals();
    context.bloc<VenueCubit>().getVenues();
    context.bloc<PertandinganCubit>().getPertandingans();

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
                OrderListPage(),
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

