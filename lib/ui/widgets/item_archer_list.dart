part of 'widgets.dart';

class ItemArcherList extends StatelessWidget {
  final ArcherModel archer;
  final double itemWidth;

  const ItemArcherList({Key? key, required this.archer, required this.itemWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage("assets/images/" + archer.image),
              fit: BoxFit.cover,
            )
          ),
        ),
        SizedBox(
          width: itemWidth - 182, //(60 + 12 + 110)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(archer.name, style: blackFontStyle2, maxLines: 1, overflow: TextOverflow.clip,),
              Text(NumberFormat.currency(
                symbol: "IDR ",
                locale: "id-ID",
                decimalDigits: 0,
              ).format(archer.price),
              style: greyFontStyle,)
            ],
          ),
        ),
        RatingStar(rate: archer.rate,)
      ],
    );
  }
}
