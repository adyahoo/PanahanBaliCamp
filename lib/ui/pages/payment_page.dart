part of 'pages.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ArcherModel archer = mockArchers[0];
    UserModel user = mockUsers[0];
    int quantity = 3;
    int delivery = 15000;
    int discount = 15000;
    int itemPrice = archer.price * quantity;

    return GeneralPage(
      title: "Pembayaran",
      subtitle: "Cek kembali item order mu!",
      onBackButtonPressed: () {},
      backColor: greyColorBody,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Item Pesanan", style: blackFontStyle3),
                SizedBox(height: 12,),
                //item pesanan
                Row(
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
                                  image: AssetImage("assets/images/" + archer.image),
                                  fit: BoxFit.cover,
                                )
                            )
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 2*defaultMargin - 60 - 12 - 78,
                              child: Text(
                                archer.name,
                                style: blackFontStyle2,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            Text(
                              NumberFormat.currency(
                                  locale: "id-ID",
                                  symbol: "IDR ",
                                  decimalDigits: 0).format(archer.price),
                              style: greyFontStyle.copyWith(fontSize: 13),
                            ),
                          ],
                        )
                      ],
                    ),
                    Text("${quantity.toString()} Items", style: greyFontStyle,),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text("Detail Pesanan", style: blackFontStyle3),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(
                        archer.name,
                        style: greyFontStyle,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      )
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: "id-ID",
                        symbol: "IDR ",
                        decimalDigits: 0,
                      ).format(itemPrice), style: blackFontStyle3
                    ),
                  ],
                ),
                SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                        child: Text(
                          "Pengiriman",
                          style: greyFontStyle,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        )
                    ),
                    Text(
                        NumberFormat.currency(
                          locale: "id-ID",
                          symbol: "IDR ",
                          decimalDigits: 0,
                        ).format(delivery), style: blackFontStyle3
                    ),
                  ],
                ),
                SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                        child: Text(
                          "Pajak 10%",
                          style: greyFontStyle,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        )
                    ),
                    Text(
                        NumberFormat.currency(
                          locale: "id-ID",
                          symbol: "IDR ",
                          decimalDigits: 0,
                        ).format(archer.price * 0.1), style: blackFontStyle3
                    ),
                  ],
                ),
                SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                        child: Text(
                          "Potongan",
                          style: greyFontStyle,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        )
                    ),
                    Text(
                        NumberFormat.currency(
                          locale: "id-ID",
                          symbol: "IDR -",
                          decimalDigits: 0,
                        ).format(discount), style: blackFontStyle3.copyWith(fontWeight: FontWeight.w500, color: redColor)
                    ),
                  ],
                ),
                SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                        child: Text(
                          "Total Price",
                          style: greyFontStyle,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        )
                    ),
                    Text(
                        NumberFormat.currency(
                          locale: "id-ID",
                          symbol: "IDR ",
                          decimalDigits: 0,
                        ).format(
                            itemPrice + delivery + archer.price*0.1 - discount),
                            style: blackFontStyle3.copyWith(color: greenColor)
                    ),
                  ],
                ),
              ]
            )
          ),
          Container(
            margin: EdgeInsets.only(bottom: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text("Alamat Pengiriman", style: blackFontStyle3),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nama", style: greyFontStyle,),
                    Text(user.name, style: blackFontStyle3),
                  ],
                ),
                SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nomor Telepon", style: greyFontStyle,),
                    Text(user.phone, style: blackFontStyle3),
                  ],
                ),
                SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Alamat", style: greyFontStyle,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(
                        user.address,
                        style: blackFontStyle3,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Detail Rumah", style: greyFontStyle,),
                    Text(user.detailAddress, style: blackFontStyle3),
                  ],
                ),
              ]
            )
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 16),
            child: RaisedButton(
              onPressed: () {},
              color: mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
              child: Text("Bayar Sekarang", style: blackFontStyle3),
            )
          )
        ]
      )
    );
  }
}
