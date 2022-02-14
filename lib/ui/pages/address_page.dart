part of 'pages.dart';

class AddressPage extends StatefulWidget {
  final UserModel user;
  final String password;
  final File? pictureFile;

  const AddressPage(this.user, this.password, this.pictureFile, {Key? key})
      : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  bool isLoading = false;
  String selectedCity = "";
  ProvinceModel? selectedProvince;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Detail Akun',
      subtitle: 'Masukan Detail Akun',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Nomor Telepon",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Masukkan Nomor Telepon"),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Alamat",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Masukkan Alamat Rumah"),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Detail Rumah",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: detailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Tambahkan Detail Rumah"),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Provinsi",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: BlocBuilder<ProvinceCubit, ProvinceState>(
                builder: (_, state) => (state is ProvinceLoaded)
                    ? DropdownButton<ProvinceModel>(
                        isExpanded: true,
                        underline: SizedBox(),
                        hint: Text("Pilih Provinsi"),
                        value: selectedProvince,
                        items: state.provinces!.map((province) {
                          return DropdownMenuItem<ProvinceModel>(
                            child: Text(
                              province.name!,
                              style: blackFontStyle3,
                            ),
                            value: province,
                          );
                        }).toList(),
                        onChanged: (item) {
                          setState(() {
                            selectedProvince = item;
                            selectedCity = "";
                          });
                          context.bloc<CityCubit>().getCities(item!.id!);
                        },
                      )
                    : loadingIndicator),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Kota",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: BlocBuilder<CityCubit, CityState>(
              builder: (_, state) => (state is CityLoaded)
                  ? DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      hint: Text("Pilih Kota"),
                      value: selectedCity.isNotEmpty ? selectedCity : null,
                      items: state.cities!.map((city) {
                        return DropdownMenuItem<String>(
                          child: Text(
                            city.name!,
                            style: blackFontStyle3,
                          ),
                          value: city.name,
                        );
                      }).toList(),
                      onChanged: (item) {
                        setState(() {
                          selectedCity = item.toString();
                        });
                      },
                    )
                  : GestureDetector(
                      onTap: () {
                        Get.snackbar(
                            "Invalid Action", "Silahkan Pilih Provinsi",
                            backgroundColor: redColor, colorText: Colors.white);
                      },
                      child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
                        hint: Text("Pilih Kota"),
                        items: [],
                      ),
                    ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: EdgeInsets.only(top: defaultMargin, bottom: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isLoading
                ? loadingIndicator
                : RaisedButton(
                    onPressed: () async {
                      UserModel user = widget.user.copyWith(
                          phone: phoneController.text,
                          address: addressController.text,
                          detailAddress: detailController.text,
                          province: selectedProvince!.name,
                          city: selectedCity);

                      setState(() {
                        isLoading = true;
                      });

                      await context.bloc<UserCubit>().register(
                          user, widget.password,
                          imageFile: widget.pictureFile);
                      UserState state = context.bloc<UserCubit>().state;

                      if (state is UserLoaded) {
                        Get.snackbar(
                          "",
                          "",
                          backgroundColor: Colors.green,
                          titleText: Text("Register Success",
                              style: blackFontStyle2.copyWith(
                                  color: Colors.white)),
                        );
                        Get.offAll(SuccessSignUpPage());
                      } else {
                        Get.snackbar("", "",
                            backgroundColor: redColor,
                            titleText: Text("Register Failed",
                                style: blackFontStyle2.copyWith(
                                    color: Colors.white)),
                            messageText: Text(
                              (state as UserLoadedFailed).message!,
                              style:
                                  blackFontStyle3.copyWith(color: Colors.white),
                            ));
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: mainColor,
                    child: Text(
                      "Daftar Sekarang",
                      style: blackFontStyle3,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
