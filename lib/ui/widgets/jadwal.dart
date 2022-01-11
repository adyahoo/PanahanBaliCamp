part of 'widgets.dart';

class Jadwal extends StatelessWidget {
  final JadwalModel jadwal;
  final Function buttonTap;
  final bool withLine;

  const Jadwal({Key? key, required this.jadwal, required this.buttonTap, this.withLine = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Stack(
        children: [
          Container(
            height: 1,
            margin: EdgeInsets.only(top: 51),
            color: (withLine == true) ? 'F2F2F2'.toColor() : Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(jadwal.name, style: blackFontStyle2,),
                  Text(jadwal.date, style: blackFontStyle3,)
                ],
              ),
              Container(
                width: 120,
                height: 30,
                child: ElevatedButton(
                  onPressed: buttonTap(),
                  child: Text(jadwal.status, style: (jadwal.status == "Recorded") ? greenFontStyle3.copyWith(fontWeight: FontWeight.bold) : blackFontStyle3.copyWith(fontWeight: FontWeight.bold)),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: (jadwal.status == "Recorded") ? BorderSide(color: greenColor) : BorderSide(color: mainColor),
                    )),
                    backgroundColor: (jadwal.status != "Recorded") ? MaterialStateProperty.all(mainColor) : MaterialStateProperty.all(Colors.white),
                  ),
                ),
              )
            ],
          ),
        ]
      ),
    );
  }
}
