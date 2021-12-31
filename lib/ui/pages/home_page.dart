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
    double listItemWidth = MediaQuery.of(context).size.width - 2 * defaultMargin;

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
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: mockArchers.map((e) => Padding(
                    padding: EdgeInsets.only(
                      left: (e == mockArchers.first) ? defaultMargin : 0,
                      right: defaultMargin,
                    ),
                    child: ItemCard(archerModel: e,),
                  )).toList(),
                )
              ],
            ),
          ),
          SizedBox(height: 32,),
          //list of vertical items
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                CustomTabbar(
                  titles: ["Paket Latihan", "Busur", "Anak Panah", "Jersey", "Aksesoris"],
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
                Builder(builder: (_) {
                  List<ArcherModel> archers = (selectedIndex == 0)
                      ? mockArchers
                      : (selectedIndex == 1) ? []
                      : (selectedIndex == 2) ? []
                      : (selectedIndex == 3) ? [] : [];

                  return Column(
                    children: archers.map((e) => Padding(
                      padding: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 16),
                      child: ItemArcherList(archer: e, itemWidth: listItemWidth)
                    )).toList(),
                  );
                }),
              ],
            ),
          ),
          SizedBox(height: 80,)
        ],
      )
    );
  }
}