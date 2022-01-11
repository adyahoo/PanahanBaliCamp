part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserModel user = mockUsers[0];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //profile detail
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 26),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: 110,
                height: 110,
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/photo_border.png")
                  )
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/${user.image}")
                    )
                  )
                )
              ),
              Text(user.name, style: blackFontStyle2.copyWith(fontSize: 18)),
              SizedBox(height: 6),
              Text(user.email, style: greyFontStyle)
            ]
          )
        ),
        SizedBox(height: defaultMargin),
        //profile page menu
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTabbar(
                titles: ["Account", "Menu"],
                selectedIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              SizedBox(height: 16),
              //list of profile menus
              (selectedIndex == 0) ?
                Container(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Ubah Profile", style: blackFontStyle3),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/right_arrow.png"),
                                  )
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Alamat Pengiriman", style: blackFontStyle3),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/right_arrow.png"),
                                  )
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Keamanan", style: blackFontStyle3),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/right_arrow.png"),
                                  )
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("ID Card", style: blackFontStyle3),
                          GestureDetector(
                            onTap: () {
                              Get.to(IdCardPage());
                            },
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/right_arrow.png"),
                                  )
                              ),
                            ),
                          )
                        ],
                      ),
                    ]
                )
              ) :
                Container(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Absensi", style: blackFontStyle3),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/right_arrow.png"),
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Toko", style: blackFontStyle3),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/right_arrow.png"),
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Statistik & Score", style: blackFontStyle3),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/right_arrow.png"),
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Informasi & Layanan", style: blackFontStyle3),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/right_arrow.png"),
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Notifikasi", style: blackFontStyle3),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/right_arrow.png"),
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                      ]
                  )
              )
            ]
          )
        )
      ]
    );
  }
}
