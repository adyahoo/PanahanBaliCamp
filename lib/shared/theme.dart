part of 'shared.dart';

Color mainColor = "FFC700".toColor();
Color secondColor = "00365E".toColor();
Color greyColor = "8D92A3".toColor();
Color greyColorBody = "FAFAFC".toColor();
Color greyStar = "ECECEC".toColor();
Color redColor = "D9435E".toColor();
Color greenColor = "1ABC9C".toColor();
Color blueColor = "005FB0".toColor();

TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle blackFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackFontStyle3 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle greenFontStyle3 = GoogleFonts.poppins()
    .copyWith(color: greenColor, fontWeight: FontWeight.w500);
TextStyle secondColorFontStyle = GoogleFonts.poppins()
    .copyWith(color: secondColor, fontWeight: FontWeight.w500);

const double defaultMargin = 24;

Widget loadingIndicator = SpinKitFadingCircle(
  color: mainColor,
  size: 45,
);

Widget noDataFound = Container(
    padding: EdgeInsets.only(bottom: 16), child: Text("No Data Found"));

SnackbarController snackbarError({String? title, String? subtitle = ""}) {
  return Get.snackbar("", "",
      backgroundColor: redColor,
      titleText:
          Text(title!, style: blackFontStyle2.copyWith(color: Colors.white)),
      messageText: Text(subtitle!,
          style: blackFontStyle3.copyWith(color: Colors.white)));
}

SnackbarController snackbarSuccess({String? title}) {
  return Get.snackbar(
    "",
    "",
    backgroundColor: Colors.green,
    titleText:
        Text(title!, style: blackFontStyle2.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
  );
}

const String storageUrl = "http://api.panahan.alengkongbalicamp.com/storage/";
const String profpicUrl = storageUrl + "profile_images/";
const String venuespicUrl = storageUrl + "venues_images/";
const String itemspicUrl = storageUrl + "items_images/";

Future<bool?> getLoginStatus() async {
  final pref = await SharedPreferences.getInstance();
  var status = pref.getBool("isLogin") ?? false;

  return status;
}

UserModel getUserData() {
  var userBox = Hive.box('userBox');
  UserModel user = userBox.getAt(0);

  return user;
}

String convertDateTimeDisplay(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
}
