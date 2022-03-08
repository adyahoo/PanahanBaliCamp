part of 'pages.dart';

class ArcherPage extends StatefulWidget {
  const ArcherPage({Key? key}) : super(key: key);

  @override
  _ArcherPageState createState() => _ArcherPageState();
}

class _ArcherPageState extends State<ArcherPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: (selectedIndex == 0)
          ? "Archery"
          : (selectedIndex == 1)
              ? "Venue"
              : "Pertandingan",
      subtitle: (selectedIndex == 0)
          ? "Kegiatan Archery kamu"
          : (selectedIndex == 1)
              ? "Venue yang tersedia"
              : "Kegiatan Pertandingan kamu",
      backColor: greyColorBody,
      child: Column(
        children: [
          Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(children: [
                CustomTabbar(
                  titles: ["Jadwal", "Venue", "Pertandingan"],
                  selectedIndex: selectedIndex,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
                SizedBox(height: 32),
                (selectedIndex == 0)
                    ? BlocBuilder<JadwalCubit, JadwalState>(
                        builder: (_, state) => (state is JadwalLoaded)
                            ? (state.jadwals!.length > 0)
                                ? Column(
                                    children: state.jadwals!
                                        .map((e) => Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: defaultMargin),
                                              child: GestureDetector(
                                                onTap: () {
                                                  Get.to(ScorePage(
                                                    jadwal: e,
                                                  ));
                                                },
                                                child: Container(
                                                  color: Colors.white,
                                                  child: Jadwal(
                                                    jadwal: e,
                                                    buttonTap: () {},
                                                  ),
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                  )
                                : noDataFound
                            : loadingIndicator,
                      )
                    : (selectedIndex == 1)
                        ? BlocBuilder<VenueCubit, VenueState>(
                            builder: (_, state) => (state is VenueLoaded)
                                ? (state.venues!.length > 0)
                                    ? Column(
                                        children: state.venues!
                                            .map((e) => Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: defaultMargin),
                                                child: Venue(
                                                  venue: e,
                                                  buttonMap: () {},
                                                )))
                                            .toList(),
                                      )
                                    : noDataFound
                                : loadingIndicator,
                          )
                        : BlocBuilder<PertandinganCubit, PertandinganState>(
                            builder: (_, state) => (state is PertandinganLoaded)
                                ? (state.pertandingans!.length > 0)
                                    ? Column(
                                        children: state.pertandingans!
                                            .map((e) => Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: defaultMargin),
                                                child: Pertandingan(
                                                    pertandingan: e)))
                                            .toList())
                                    : noDataFound
                                : loadingIndicator,
                          ),
                SizedBox(height: 16)
              ]))
        ],
      ),
    );
  }
}
