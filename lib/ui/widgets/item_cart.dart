part of 'widgets.dart';

class ItemCart extends StatefulWidget {
  final Cart cart;

  const ItemCart({Key? key, required this.cart}) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState(qty: cart.qty!);
}

class _ItemCartState extends State<ItemCart> {
  int? currentState;
  int qty;
  UserModel user = getUserData();

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
                      image: NetworkImage(itemspicUrl + widget.cart.image!),
                      fit: BoxFit.cover)),
            ),
            //item of cart
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cart.itemName!,
                  style: blackFontStyle2,
                ),
                (currentState != 0)
                    ? Text(
                        "${qty} items • " +
                            NumberFormat.currency(
                              symbol: "IDR ",
                              locale: "id-ID",
                              decimalDigits: 0,
                            ).format(widget.cart.price! * qty),
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
                                    image:
                                        AssetImage("assets/images/minus.png")),
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
                              )),
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
                                        image: AssetImage(
                                            "assets/images/plus.png")))),
                          ),
                        ],
                      ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () async {
                if (currentState == 0) {
                  await context
                      .bloc<CartCubit>()
                      .editQtyCart(widget.cart.id!, qty);
                  var state = context.bloc<CartCubit>().state;

                  if (state is CartPostSuccess) {
                    snackbarSuccess(title: state.msg!);
                    setState(() {
                      currentState = 1;
                      context.bloc<CartCubit>().getCarts(user.id!);
                    });
                  } else {
                    snackbarError(
                        title: "Gagal Mengubah Keranjang",
                        subtitle: (state as CartLoadedFailed).msg!);
                  }
                } else {
                  setState(() {
                    currentState = 0;
                  });
                }
              },
              child: Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      color: (currentState == 0) ? greenColor : mainColor,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: (currentState == 0)
                            ? AssetImage("assets/images/oke.png")
                            : AssetImage("assets/images/edit.png"),
                        fit: BoxFit.none,
                      ))),
            ),
            GestureDetector(
              onTap: () {
                if (currentState == 0) {
                  setState(() {
                    currentState = 1;
                  });
                } else {
                  showAlertDialog(context);
                }
              },
              child: Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: (currentState == 0)
                            ? AssetImage("assets/images/cancel.png")
                            : AssetImage("assets/images/delete.png"),
                        fit: BoxFit.none,
                      ))),
            ),
          ],
        )
      ],
    );
  }

  void showAlertDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text("Hapus Item")),
          content: Text("Yakin Ingin Menghapus Item dari Keranjang?"),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
                onPressed: () async {
                  await context.bloc<CartCubit>().deleteCart(widget.cart.id!);
                  var state = context.bloc<CartCubit>().state;

                  if (state is CartPostSuccess) {
                    snackbarSuccess(title: "Berhasil Menghapus Item");
                    setState(() {
                      context.bloc<CartCubit>().getCarts(user.id!);
                    });
                  } else {
                    snackbarError(
                        title: "Gagal Menghapus Item",
                        subtitle: (state as CartLoadedFailed).msg!);
                  }
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(greenColor)),
                child: Text("Ya")),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(redColor)),
                child: Text("Batal")),
          ],
        );
      });
}
