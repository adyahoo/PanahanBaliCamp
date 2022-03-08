part of 'pages.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({Key? key}) : super(key: key);

  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Pemesanan",
      subtitle: "Cek Proses Pesanan mu disini!",
      backColor: greyColorBody,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            CustomTabbar(
              titles: ["Proses", "Selesai"],
              selectedIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
            SizedBox(height: 16),
            Builder(builder: (_) {
              List<Transaction> transactions =
                  (selectedIndex == 0) ? mockTransactions : mockTransactions;

              return Column(
                children: transactions
                    .map((e) => Padding(
                          padding: EdgeInsets.fromLTRB(
                              defaultMargin, 0, defaultMargin, 16),
                          child: GestureDetector(
                              onTap: () {
                                Get.to(OrderDetailPage(transaction: e,));
                              },
                              child: Container(
                                color: Colors.white,
                                child: ItemOrder(
                                  transaction: e,
                                ),
                              )),
                        ))
                    .toList(),
              );
            })
          ],
        ),
      ),
    );
  }
}
