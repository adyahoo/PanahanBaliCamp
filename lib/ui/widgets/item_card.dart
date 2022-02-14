part of 'widgets.dart';

class ItemCard extends StatelessWidget {
  final ArcherModel? archerModel;

  const ItemCard({Key? key, this.archerModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 210,
      // padding: EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(
          blurRadius: 15, color: "F2F2F2".toColor()
        )]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //image of card
          Container(
            width: 200,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              image: DecorationImage(
                image: AssetImage("assets/images/" + archerModel!.image!),
                fit: BoxFit.cover,
              )
            ),
          ),
          //name of card
          Container(
            margin: EdgeInsets.fromLTRB(12, 8, 0, 2),
            child: Text(archerModel!.name!, maxLines: 1, overflow: TextOverflow.clip, style: blackFontStyle2,),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //price of card
                Text(NumberFormat.currency(
                  locale: "id-ID",
                  symbol: "IDR ",
                  decimalDigits: 0
                ).format(archerModel!.price)),
                //rate of card
                RatingCardStar(rate: archerModel!.rate!)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
