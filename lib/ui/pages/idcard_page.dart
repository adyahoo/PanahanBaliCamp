part of 'pages.dart';

class IdCardPage extends StatefulWidget {
  const IdCardPage({Key? key}) : super(key: key);

  @override
  _IdCardPageState createState() => _IdCardPageState();
}

class _IdCardPageState extends State<IdCardPage> {
  @override
  Widget build(BuildContext context) {
    UserModel user = getUserData();

    return GeneralPage(
        title: "Id Card",
        subtitle: "Id Card Membership",
        onBackButtonPressed: () {
          Get.back();
        },
        backColor: greyColorBody,
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(defaultMargin),
            color: Colors.white,
            child: Column(children: [
              Container(
                width: 90,
                height: 90,
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/photo_border.png"))),
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(profpicUrl+user.image!),
                          fit: BoxFit.cover,
                        ))),
              ),
              Text(user.name!,
                  style: blackFontStyle2.copyWith(fontSize: 18)),
              SizedBox(height: 6),
              Text(user.email!, style: greyFontStyle),
              SizedBox(height: defaultMargin),
              FlipCard(
                direction: FlipDirection.HORIZONTAL,
                front: Container(
                    width: double.infinity,
                    height: 195,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage("assets/images/front_id.png"),
                            fit: BoxFit.contain))),
                back: Container(
                    width: double.infinity,
                    height: 195,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage("assets/images/back_id.png"),
                            fit: BoxFit.contain))),
              ),
            ])));
  }
}
