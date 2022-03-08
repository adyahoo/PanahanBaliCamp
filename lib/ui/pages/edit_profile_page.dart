part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  final UserModel user;

  const EditProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? selectedProfPic;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bornDateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController identityNumberController = TextEditingController();
  String selectedGender = "";
  String selectedCity = "";
  ProvinceModel? selectedProvince;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.user.name!;
    emailController.text = widget.user.email!;
    phoneController.text = widget.user.phone!;
    addressController.text = widget.user.address!;

    return GeneralPage(
        title: "Edit Profile",
        subtitle: "Ubah Informasi Pribadi Anda",
        onBackButtonPressed: () {
          Get.back();
        },
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                PickedFile pickedFile =
                    await ImagePicker().getImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  selectedProfPic = File(pickedFile.path);
                  setState(() {});
                }
              },
              child: Container(
                width: 110,
                height: 110,
                margin: EdgeInsets.only(top: 26),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/photo_border.png"),
                )),
                child: (selectedProfPic != null)
                    ? Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: FileImage(selectedProfPic!),
                                fit: BoxFit.cover)),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image:
                                  NetworkImage(profpicUrl + widget.user.image!),
                              fit: BoxFit.cover,
                            )),
                      ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
              child: Text(
                "Nama Lengkap",
                style: blackFontStyle2,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.black,
                  )),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Masukkan Nama Lengkap",
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
              child: Text(
                "Alamat Email",
                style: blackFontStyle2,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.black,
                  )),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Masukkan Alamat Email",
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
              child: Text(
                "Tanggal Lahir",
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
                controller: bornDateController,
                readOnly: true,
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(1900, 1),
                      lastDate: DateTime(2100));
                  if (picked != null) {
                    setState(() {
                      selectedDate = picked;
                      bornDateController.value = TextEditingValue(
                          text: convertDateTimeDisplay(picked.toString()));
                    });
                  }
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: greyFontStyle,
                    hintText: "Masukkan Tanggal Lahir"),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
              child: Text(
                "Jenis Kelamin",
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
                child: DropdownButton(
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: Text("Pilih Jenis Kelamin"),
                  value: selectedGender.isNotEmpty ? selectedGender : null,
                  items: [
                    DropdownMenuItem(
                      value: "Laki-laki",
                      child: Text("Laki-laki"),
                    ),
                    DropdownMenuItem(
                        value: "Perempuan", child: Text("Perempuan"))
                  ],
                  onChanged: (item) {
                    setState(() {
                      selectedGender = item.toString();
                    });
                  },
                )),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
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
                    hintText: "Masukkan Alamat"),
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
                builder: (_, state) => (state is CityLoaded &&
                        selectedProvince != null)
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
                              backgroundColor: redColor,
                              colorText: Colors.white);
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
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
              child: Text(
                "Nomor KTP",
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
                controller: identityNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: greyFontStyle,
                    hintText: "Masukkan Nomor KTP"),
              ),
            ),
            Container(
              width: double.infinity,
              height: 45,
              margin: EdgeInsets.symmetric(vertical: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: RaisedButton(
                onPressed: () {
                  (nameController.text.isNotEmpty &&
                          emailController.text.isNotEmpty &&
                          bornDateController.text.isNotEmpty &&
                          selectedGender != null &&
                          phoneController.text.isNotEmpty &&
                          addressController.text.isNotEmpty &&
                          selectedProvince != null &&
                          selectedCity != null &&
                          identityNumberController.text.isNotEmpty)
                      ? snackbarError(title: "Berhasil")
                      : snackbarError(
                          title: "Register Failed",
                          subtitle: "Please Fill All The Field");
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: mainColor,
                child: Text(
                  "Berikutnya",
                  style: blackFontStyle3,
                ),
              ),
            ),
          ],
        ));
  }
}
