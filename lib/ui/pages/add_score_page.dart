part of 'pages.dart';

class AddScorePage extends StatefulWidget {
  final JadwalModel jadwal;

  const AddScorePage({Key? key, required this.jadwal}) : super(key: key);

  @override
  _AddScorePageState createState() => _AddScorePageState();
}

class _AddScorePageState extends State<AddScorePage> {
  TextEditingController distanceController = TextEditingController();
  TextEditingController scoreController = TextEditingController();
  TextEditingController sessionController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
        title: "Tambah Score",
        subtitle: "Tambahkan Score Latihan",
        onBackButtonPressed: () {
          Get.back();
        },
        backColor: greyColorBody,
        child: Container(
          height: MediaQuery.of(context).size.height - 180,
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(defaultMargin),
                    color: Colors.white,
                    child: Jadwal(
                      jadwal: widget.jadwal,
                      buttonTap: () {},
                      withLine: false,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.all(defaultMargin),
                      margin: EdgeInsets.only(bottom: defaultMargin),
                      child: Column(children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 6),
                          child: Text(
                            "Masukan Sesi Latihan",
                            style: blackFontStyle2,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.black,
                              )),
                          child: TextField(
                            controller: sessionController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: greyFontStyle,
                              hintText: "Masukan Sesi Latihan",
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 6),
                          child: Text(
                            "Masukan Jarak",
                            style: blackFontStyle2,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.black,
                              )),
                          child: TextField(
                            controller: distanceController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: greyFontStyle,
                              hintText: "Masukan Jarak Latihan",
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 6),
                          child: Text(
                            "Score",
                            style: blackFontStyle2,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.black,
                              )),
                          child: TextField(
                            controller: scoreController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: greyFontStyle,
                              hintText: "Masukan Score",
                            ),
                          ),
                        ),
                      ])),
                ],
              )
            ),
            Container(
                width: double.infinity,
                color: Colors.white,
                padding:
                    EdgeInsets.symmetric(vertical: 16, horizontal: defaultMargin),
                child: !isLoading
                    ? ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          if (sessionController.text.isNotEmpty &&
                              distanceController.text.isNotEmpty &&
                              scoreController.text.isNotEmpty) {
                            await context.bloc<ScoreCubit>().postScore(
                                widget.jadwal.id!,
                                scoreController.text.toInt(),
                                distanceController.text.toInt(),
                                sessionController.text.toInt());
                            var state = context.bloc<ScoreCubit>().state;
                            if (state is ScorePosted) {
                              snackbarSuccess(title: state.msg!);
                              Get.off(ScorePage(
                                jadwal: widget.jadwal,
                              ));
                            } else {
                              snackbarError(
                                  title: "Add Score Failed",
                                  subtitle: (state as ScoreLoadedFailed).msg);
                              setState(() {
                                isLoading = false;
                              });
                            }
                          } else {
                            snackbarError(
                                title: "Add Score Failed",
                                subtitle: "Please Fill All The Field");

                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        child: Text("Simpan", style: blackFontStyle3),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(mainColor),
                            elevation: MaterialStateProperty.all(0),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(vertical: 12))),
                      )
                    : loadingIndicator)
          ]),
        ));
  }
}
