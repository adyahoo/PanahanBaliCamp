part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;

    return GeneralPage(
        title: "Toko",
        subtitle: "Beli kebutuhan Archery disini.",
        backColor: greyColorBody,
        child: Column(
          children: [
            //list of horizontal cards
            Container(
              height: 210,
              width: double.infinity,
              child: BlocBuilder<ArcherCubit, ArcherState>(
                builder: (_, state) => (state is ArcherLoaded)
                    ? ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: state.archers!
                                .map(
                                  (e) => Padding(
                                      padding: EdgeInsets.only(
                                        left: (e == state.archers!.first)
                                            ? defaultMargin
                                            : 0,
                                        right: defaultMargin,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(ArcherDetailPage(
                                            transaction: Transaction(
                                              archer: e,
                                              user: getUserData()
                                            ),
                                            onBackButtonPressed: () {
                                              Get.back();
                                            },
                                          ));
                                        },
                                        child: ItemCard(
                                          archerModel: e,
                                        ),
                                      )),
                                )
                                .toList(),
                          )
                        ],
                      )
                    : Center(child: loadingIndicator),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            //list of vertical items
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabbar(
                    titles: [
                      "Paket Latihan",
                      "Busur",
                      "Anak Panah",
                      "Jersey",
                      "Aksesoris"
                    ],
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<ArcherCubit, ArcherState>(builder: (_, state) {
                    if (state is ArcherLoaded) {
                      List<ArcherModel> archers = state.archers!.where(
                          (element) => element.category!.contains(
                              (selectedIndex == 0)
                                  ? "Alat Panahan"
                                  : "Membership"
                              // : (selectedIndex == 1)
                              // ? "Busur"
                              // : (selectedIndex == 2)
                              // ? "Anak Panah"
                              // : (selectedIndex == 3)
                              // ? "Jersey" : "Aksesoris")
                              )).toList();

                      return Column(
                        children: archers
                            .map((e) => Padding(
                                padding: EdgeInsets.fromLTRB(
                                    defaultMargin, 0, defaultMargin, 16),
                                child: ItemArcherList(
                                    archer: e, itemWidth: listItemWidth)))
                            .toList(),
                      );
                    } else {
                      return Center(child: loadingIndicator);
                    }
                  }),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        ));
  }
}
