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

const String profpicUrl = "https://api.panahan.alengkongbalicamp.com/storage/profile_images/";