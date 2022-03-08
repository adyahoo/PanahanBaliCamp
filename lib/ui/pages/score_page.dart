part of 'pages.dart';

class ScorePage extends StatefulWidget {
  final JadwalModel? jadwal;

  const ScorePage({Key? key, this.jadwal}) : super(key: key);

  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<ScorePage> {
  int? detailId;

  @override
  Widget build(BuildContext context) {
    context.bloc<ScoreCubit>().getScores(widget.jadwal!.id!);
    return GeneralPage(
      title: "Score",
      subtitle: "Score Kegiatan Archery kamu",
      backColor: greyColorBody,
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(defaultMargin),
            color: Colors.white,
            child: Jadwal(
              jadwal: widget.jadwal!,
              buttonTap: () {},
              withLine: false,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            height:
                MediaQuery.of(context).size.height - 2 * defaultMargin - 240,
            padding: EdgeInsets.all(defaultMargin),
            color: Colors.white,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Expanded(
                child: ListView(
                  children: [
                    BlocBuilder<ScoreCubit, ScoreState>(
                      builder: (_, state) => (state is ScoreLoaded)
                          ? (state.scores!.isNotEmpty)
                              ? Column(
                                  children: state.scores!
                                      .map((e) => ScoreList(
                                            index: e.session!,
                                            score: e,
                                          ))
                                      .toList())
                              : Center(child: Text("No Data Found"))
                          : loadingIndicator,
                    ),
                  ],
                ),
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
                    Get.off(AddScorePage(
                      jadwal: widget.jadwal!,
                    ));
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
