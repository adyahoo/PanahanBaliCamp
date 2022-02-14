part of 'widgets.dart';

class Pertandingan extends StatelessWidget {
  final PertandinganModel pertandingan;

  const Pertandingan({Key? key, required this.pertandingan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  margin: EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: AssetImage("assets/images/" + pertandingan.image!),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(pertandingan.name!, style: blackFontStyle2,),
                    Container(
                        width: 180,
                        child: Text(
                          pertandingan.description!,
                          style: greyFontStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        )
                    ),
                    Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/pin.png")
                                  )
                              ),
                            ),
                            SizedBox(width: 4,),
                            Text("${pertandingan.address} | ${pertandingan.schedule}", style: greyFontStyle.copyWith(color: Colors.white, fontSize: 8),)
                          ],
                        )
                    ),
                  ],
                ),
              ],
            ),
            Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage("assets/images/3_dot.png"),
                      fit: BoxFit.none,
                    )
                )
            )
          ],
        )
    );
  }
}
