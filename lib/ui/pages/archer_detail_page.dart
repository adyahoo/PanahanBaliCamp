part of 'pages.dart';

class ArcherDetailPage extends StatefulWidget {
  final Function onBackButtonPressed;
  final Transaction? transaction;
  final UserModel user;
  final ArcherModel archer;

  const ArcherDetailPage(
      {Key? key,
      required this.onBackButtonPressed,
      required this.user,
      required this.archer,
      this.transaction})
      : super(key: key);

  @override
  _ArcherDetailPageState createState() => _ArcherDetailPageState();
}

class _ArcherDetailPageState extends State<ArcherDetailPage> {
  int quantity = 1;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: mainColor),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          SafeArea(
            child: Container(
              width: double.infinity,
              height: 330,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(itemspicUrl + widget.archer.image!),
                fit: BoxFit.cover,
              )),
            ),
          ),
          SafeArea(
              child: ListView(
            children: [
              Column(
                children: [
                  //back button
                  Container(
                      height: 100,
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            widget.onBackButtonPressed();
                          },
                          child: Container(
                            padding: EdgeInsets.all(3),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black12,
                            ),
                            child: Image.asset(
                                "assets/images/back_arrow_white.png"),
                          ),
                        ),
                      ))
                ],
              )
            ],
          )),
          SafeArea(
              child: ListView(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 320,
                margin: EdgeInsets.only(top: 280),
                padding: EdgeInsets.all(defaultMargin),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //name and rating
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width -
                                        134, //32+102,
                                    child: Text(
                                      widget.archer.name!,
                                      style: blackFontStyle2,
                                    ),
                                  ),
                                  RatingStar(
                                    rate: widget.archer.rate!,
                                  )
                                ],
                              ),
                              //add-minus button
                              Row(
                                children: [
                                  //minus button
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity = max(1, quantity - 1);
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
                                                "assets/images/minus.png")),
                                      ),
                                    ),
                                  ),
                                  //current quantity
                                  SizedBox(
                                      width: 30,
                                      child: Text(
                                        quantity.toString(),
                                        style: blackFontStyle2,
                                        textAlign: TextAlign.center,
                                      )),
                                  //plus button
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity = min(999, quantity + 1);
                                      });
                                    },
                                    child: Container(
                                        width: 26,
                                        height: 26,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(width: 1),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/plus.png")))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //category part
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kategori",
                                style: blackFontStyle3,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                  width: 83,
                                  height: 28,
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: secondColor,
                                  ),
                                  child: Center(
                                      child: Text(
                                    widget.archer.category!,
                                    style: greyFontStyle.copyWith(
                                        color: Colors.white, fontSize: 10),
                                  ))),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          //description part
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Deskripsi",
                                style: blackFontStyle3,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height - 600,
                                child: Scrollbar(
                                  child: ListView(children: [
                                    Text(
                                      widget.archer.description!,
                                      style: greyFontStyle,
                                      // maxLines: 4,
                                      // overflow: TextOverflow.clip,
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 22,
                          ),
                        ],
                      )),
                    ),
                    //total and order button
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //total price from price * quantity
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Price: ",
                                style: greyFontStyle,
                              ),
                              Text(
                                NumberFormat.currency(
                                  symbol: "IDR ",
                                  locale: "id-ID",
                                  decimalDigits: 0,
                                ).format(quantity * widget.archer.price!),
                                style: blackFontStyle2.copyWith(fontSize: 18),
                              )
                            ],
                          ),
                          //order button
                          SizedBox(
                              width: 163,
                              height: 45,
                              child: !isLoading
                                  ? RaisedButton(
                                      onPressed: () async {
                                        setState(() {
                                          isLoading = true;
                                        });

                                        await context
                                            .bloc<CartCubit>()
                                            .postCarts(
                                                widget.user.id!,
                                                widget.archer.id!,
                                                "barang",
                                                quantity);
                                        var state =
                                            context.bloc<CartCubit>().state;

                                        if (state is CartPostSuccess) {
                                          snackbarSuccess(title: state.msg!);
                                          Get.off(CartPage(user: widget.user));
                                        } else {
                                          snackbarError(
                                              title: "Gagal Menambah Keranjang",
                                              subtitle:
                                                  (state as CartLoadedFailed)
                                                      .msg!);
                                          setState(() {
                                            isLoading = false;
                                          });
                                        }
                                      },
                                      color: mainColor,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        "Order Now",
                                        style: blackFontStyle3.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  : loadingIndicator),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
