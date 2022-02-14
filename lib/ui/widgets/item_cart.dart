part of 'widgets.dart';

class ItemCart extends StatefulWidget {
  final Cart cart;

  const ItemCart({Key? key, required this.cart}) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState(
    qty: cart.qty!
  );
}

class _ItemCartState extends State<ItemCart> {
  int? currentState;
  int qty;

  _ItemCartState({required this.qty});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            //image of cart
            Container(
              width: 60,
              height: 60,
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/${widget.cart.archer!.image!}"),
                      fit: BoxFit.cover)),
            ),
            //item of cart
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cart.archer!.name!,
                  style: blackFontStyle2,
                ),
                (currentState != 0)
                    ? Text(
                        "${qty} items • " +
                            NumberFormat.currency(
                              symbol: "IDR ",
                              locale: "id-ID",
                              decimalDigits: 0,
                            ).format(widget.cart.total),
                        style: greyFontStyle,
                      )
                    : Row(
                  children: [
                    //minus button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          qty = max(1, qty - 1);
                        });
                      },
                      child: Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1),
                          image: DecorationImage(
                              image: AssetImage("assets/images/minus.png")
                          ),
                        ),
                      ),
                    ),
                    //current quantity
                    SizedBox(
                        width: 30,
                        child: Text(
                          qty.toString(),
                          style: blackFontStyle2,
                          textAlign: TextAlign.center,
                        )
                    ),
                    //plus button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          qty = min(999, qty + 1);
                        });
                      },
                      child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(width: 1),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/plus.png")
                              )
                          )
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              currentState = (currentState == 0) ? 1 : 0;
            });
          },
          child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                  color: (currentState == 0) ? Colors.red : mainColor,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: (currentState == 0)
                        ? AssetImage("assets/images/delete.png")
                        : AssetImage("assets/images/edit.png"),
                    fit: BoxFit.none,
                  ))),
        ),
      ],
    );
  }
}
