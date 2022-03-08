part of 'widgets.dart';

class ScoreList extends StatelessWidget {
  final int index;
  final ScoreModel score;

  const ScoreList({Key? key, required this.index, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Stack(
          children: [
            Container(
              height: 1,
              margin: EdgeInsets.only(top: 51),
              color: 'F2F2F2'.toColor(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sesi ${index}", style: blackFontStyle2,),
                    Text("Jarak ${score.length} Meter", style: blackFontStyle3,)
                  ],
                ),
                Container(
                  width: 50,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black, width: 2.0)
                  ),
                  child: Text(score.score.toString(), style: blackFontStyle1),
                  alignment: Alignment.center,
                )
              ],
            ),
          ]
      ),
    );
  }
}
