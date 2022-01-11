part of 'pages.dart';

class AddScorePage extends StatefulWidget {
  const AddScorePage({Key? key}) : super(key: key);

  @override
  _AddScorePageState createState() => _AddScorePageState();
}

class _AddScorePageState extends State<AddScorePage> {
  JadwalModel jadwal = mockJadwal[0];
  List<VenueModel> venue = mockVenue;
  VenueModel? selectedVenue;
  DateTime selectedDate = DateTime.now();
  TextEditingController trainingDateController = TextEditingController();
  TextEditingController distanceController = TextEditingController();
  TextEditingController scoreController = TextEditingController();
  TextEditingController venueController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        trainingDateController.value =
            TextEditingValue(text: picked.toString().split(' ')[0]);
      });
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
        title: "Tambah Score",
        subtitle: "Tambahkan Score Latihan",
        onBackButtonPressed: () {
          Get.back();
        },
        backColor: greyColorBody,
        child: Column(children: [
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
              color: Colors.white,
              padding: EdgeInsets.all(defaultMargin),
              margin: EdgeInsets.only(bottom: defaultMargin),
              child: Column(children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 6),
                  child: Text(
                    "Tanggal Latihan",
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
                    child: GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextField(
                            controller: trainingDateController,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: greyFontStyle,
                              hintText: "Pilih Tanggal Latihan",
                            ),
                          ),
                        ))),
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
                    "Venue",
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
                    child: Dropdown<VenueModel>(
                      hintText: "Pilih Venue Latihan",
                      options: venue,
                      value: selectedVenue,
                      onChanged: (value) {
                        setState(() {
                          selectedVenue = value;
                        });
                      },
                      getLabel: (value) => value.name,
                    )),
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
          Container(
              width: double.infinity,
              color: Colors.white,
              padding:
                  EdgeInsets.symmetric(vertical: 16, horizontal: defaultMargin),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Simpan", style: blackFontStyle3),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(mainColor),
                    elevation: MaterialStateProperty.all(0),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 12))),
              ))
        ]));
  }
}
