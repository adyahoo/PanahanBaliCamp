part of 'pages.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    JadwalModel jadwal = mockJadwal[0];
    List<ScoreModel> score = mockScore;

    return GeneralPage(
      title: "Score",
      subtitle: "Score Kegiatan Archery kamu",
      backColor: greyColorBody,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(defaultMargin),
            color: Colors.white,
            child: Jadwal(
              jadwal: jadwal,
              buttonTap: () {},
              withLine: false,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(defaultMargin),
            color: Colors.white,
            child: Column(children: [
              Container(
                child: Column(
                  children: (score)
                      .mapIndexed((currentValue, index) => ScoreList(
                            index: index + 1,
                            score: currentValue,
                          ))
                      .toList(),
                ),
              ),
              SizedBox(
                height: 120,
              ),
              Container(
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(mainColor),
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 12))),
                  onPressed: () {
                    Get.to(AddScorePage());
                  },
                  child: Text(
                    "Tambah Score",
                    style:
                        blackFontStyle3.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
