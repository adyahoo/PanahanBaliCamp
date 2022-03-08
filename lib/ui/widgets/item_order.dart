part of 'widgets.dart';

class ItemOrder extends StatelessWidget {
  final Transaction transaction;

  const ItemOrder({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //image of order
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: AssetImage("assets/images/${transaction.carts![0].image!}"),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: 12,
        ),
        //item of order
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transaction.carts![0].itemName!,
              style: blackFontStyle2,
            ),
            Text(
              "${transaction.carts![0].qty} items • " +
                  NumberFormat.currency(
                    symbol: "IDR ",
                    locale: "id-ID",
                    decimalDigits: 0,
                  ).format(transaction.carts![0].price!),
              style: greyFontStyle,
            )
          ],
        )
      ],
    );
  }
}
