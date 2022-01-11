part of 'pages.dart';

class IllustrationPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final String titleButton1;
  final String? titleButton2;
  final VoidCallback buttonTap1;
  final VoidCallback? buttonTap2;

  const IllustrationPage({Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.titleButton1,
    this.titleButton2,
    required this.buttonTap1,
    this.buttonTap2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            margin: EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/" + image),
                fit: BoxFit.contain,
              )
            )
          ),
          Text(title, style: blackFontStyle3.copyWith(fontSize: 20)),
          Text(subtitle, style: greyFontStyle, textAlign: TextAlign.center,),
          Container(
            width: 200,
            height: 45,
            margin: EdgeInsets.only(top: 30, bottom: 12),
            child: ElevatedButton(
              onPressed: buttonTap1,
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(mainColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ))
              ),
              child: Text(titleButton1, style: blackFontStyle3)
            )
          ),
          (buttonTap2) == null ? SizedBox() :
            SizedBox(
                width: 200,
                height: 45,
                child: ElevatedButton(
                  onPressed: buttonTap2,
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(greyColor),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ))
                  ),
                  child: Text(
                      titleButton2 ?? "title button 2",
                      style: blackFontStyle3.copyWith(color: Colors.white)
                  ),
                )
            ),
        ],
      )
    );
  }
}