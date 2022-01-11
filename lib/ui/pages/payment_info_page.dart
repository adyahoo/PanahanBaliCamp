part of 'pages.dart';

class PaymentInfoPage extends StatefulWidget {
  const PaymentInfoPage({Key? key}) : super(key: key);

  @override
  _PaymentInfoPageState createState() => _PaymentInfoPageState();
}

class _PaymentInfoPageState extends State<PaymentInfoPage> {
  String cardId = "6290 8137 2199 3128";

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
        title: "Pembayaran",
        subtitle: "Lakukan Pembayaran",
        onBackButtonPressed: () {
          Get.back();
        },
        backColor: greyColorBody,
        child: Column(children: [
          Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height - 286,
              padding:
                  EdgeInsets.symmetric(vertical: 16, horizontal: defaultMargin),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Virtual Account",
                    style: blackFontStyle3,
                  ),
                  SizedBox(height: 10),
                  Text(
                      "Lakukan Pembayaran melalui code virtual\naccount berikut",
                      style: greyFontStyle),
                  SizedBox(height: 16),
                  Container(
                      width: double.infinity,
                      height: 200,
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/dollar.png"),
                                  ))),
                              Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/logo_bca.png"),
                                          fit: BoxFit.cover)))
                            ]),
                        SizedBox(height: 40),
                        Container(
                            width: double.infinity,
                            height: 44,
                            alignment: Alignment.center,
                            child: Text(cardId,
                                style: blackFontStyle1.copyWith(
                                    fontSize: 29, color: Colors.white)))
                      ]))
                ],
              )),
          SizedBox(height: defaultMargin),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Sudah Bayar",
                  style: blackFontStyle3.copyWith(color: Colors.white)),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 12)),
                backgroundColor: MaterialStateProperty.all(mainColor),
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Bantuan",
                    style: blackFontStyle3.copyWith(color: Colors.white)),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 12)),
                  backgroundColor: MaterialStateProperty.all(redColor),
                ),
              ))
        ]));
  }
}
