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
    List<JadwalModel> jadwals = mockJadwal;
    List<VenueModel> venues = mockVenue;
    List<PertandinganModel> pertandingans = mockPertandingan;

    return GeneralPage(
      title: (selectedIndex == 0) ? "Archery"
          : (selectedIndex == 1) ? "Venue"
          : "Pertandingan",
      subtitle: (selectedIndex == 0) ? "Kegiatan Archery kamu"
          : (selectedIndex == 1) ? "Venue yang tersedia"
          : "Kegiatan Pertandingan kamu",
      backColor: greyColorBody,
      child: Column(
        children: [
          Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                  children: [
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
                    Column(
                      children: (selectedIndex == 0 ? (jadwals).map((e) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                        child: Jadwal(jadwal: e, buttonTap: () {},),
                      )).toList() :
                          selectedIndex == 1 ? (venues).map((e) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Venue(venue: e, buttonMap: () {},)
                          )).toList() :
                          (pertandingans).map((e) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Pertandingan(pertandingan: e)
                          )).toList()
                      ),
                    ),
                    SizedBox(height: 16)
                  ]
              )
          )
        ],
      ),
    );
  }
}

