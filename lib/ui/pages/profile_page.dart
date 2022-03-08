part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    UserModel user = getUserData();
    return Column(children: [
      //profile detail
      Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 26),
          color: Colors.white,
          child: Column(children: [
            Container(
                width: 110,
                height: 110,
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/photo_border.png"))),
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(profpicUrl + user.image!),
                            fit: BoxFit.cover)))),
            Text(user.name!, style: blackFontStyle2.copyWith(fontSize: 18)),
            SizedBox(height: 6),
            Text(user.email!, style: greyFontStyle)
          ])),
      SizedBox(height: defaultMargin),
      //profile page menu
      Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16),
          color: Colors.white,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            (selectedIndex == 0)
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Column(children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(EditProfilePage(user: user));
                        },
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Ubah Profile", style: blackFontStyle3),
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/right_arrow.png"),
                                )),
                              ),
                            ],
                          ),
                        ),
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
                                image:
                                    AssetImage("assets/images/right_arrow.png"),
                              )),
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
                                image:
                                    AssetImage("assets/images/right_arrow.png"),
                              )),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Get.to(IdCardPage());
                        },
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("ID Card", style: blackFontStyle3),
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/right_arrow.png"),
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]))
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Column(children: [
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
                                image:
                                    AssetImage("assets/images/right_arrow.png"),
                              )),
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
                                image:
                                    AssetImage("assets/images/right_arrow.png"),
                              )),
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
                                image:
                                    AssetImage("assets/images/right_arrow.png"),
                              )),
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
                                image:
                                    AssetImage("assets/images/right_arrow.png"),
                              )),
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
                                image:
                                    AssetImage("assets/images/right_arrow.png"),
                              )),
                            ),
                          )
                        ],
                      ),
                    ]))
          ])),
      //button logout
      GestureDetector(
        onTap: () async {
          setState(() {
            isLoading = true;
          });

          await context.bloc<UserCubit>().logout();
          var state = context.bloc<UserCubit>().state;

          if (state is UserPostSuccess) {
            Get.snackbar(
              "",
              "",
              backgroundColor: Colors.green,
              titleText: Text("Logout Success",
                  style: blackFontStyle2.copyWith(color: Colors.white)),
            );

            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.clear();

            var userBox = Hive.box('userBox');
            userBox.clear();

            Get.to(SignInPage());
          } else {
            Get.snackbar("", "",
                backgroundColor: redColor,
                titleText: Text("Logout Failed",
                    style: blackFontStyle2.copyWith(color: Colors.white)),
                messageText: Text((state as UserLoadedFailed).message!,
                    style: blackFontStyle3.copyWith(color: Colors.white)));

            setState(() {
              isLoading = false;
            });
          }
        },
        child: isLoading
            ? loadingIndicator
            : Container(
                width: double.infinity,
                margin: EdgeInsets.all(defaultMargin),
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: redColor),
                child: Text("Logout",
                    style: blackFontStyle3.copyWith(color: Colors.white))),
      )
    ]);
  }
}
