part of 'pages.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  TextEditingController voucherController = TextEditingController();
  int currentState = 0;
  int? selectedItem;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
        title: "Keranjang",
        subtitle: "Item di keranjang mu",
        onBackButtonPressed: () {
          Get.back();
        },
        backColor: greyColorBody,
        child: Column(children: [
          //list of items in cart
          Container(
              width: double.infinity,
              height: (MediaQuery.of(context).size.height) - 260,
              padding: EdgeInsets.all(defaultMargin),
              color: Colors.white,
              child: ListView(
                children: [
                  Column(
                    children: mockCarts
                        .map(
                          (e) => Container(
                            margin: EdgeInsets.only(
                                bottom: (e != mockCarts.last) ? 16 : 0),
                            child: ItemCart(
                              cart: e,
                            ),
                          ),
                        ).toList(),
                  )
                ],
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height - 650,
          ),
          //voucher and button submit
          Container(
            width: double.infinity,
            padding:
                EdgeInsets.symmetric(vertical: 14, horizontal: defaultMargin),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //voucher input field
                Container(
                  width: MediaQuery.of(context).size.width -
                      2 * defaultMargin -
                      120,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black),
                  ),
                  child: TextField(
                    controller: voucherController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: greyFontStyle,
                        hintText: "Masukkan Kode Voucher"),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(mainColor),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 12, horizontal: 25)),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  child: Text(
                    "Bayar",
                    style: blackFontStyle3,
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}
