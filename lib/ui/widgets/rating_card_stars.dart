part of 'widgets.dart';

class RatingCardStar extends StatelessWidget {
  final double rate;

  const RatingCardStar({Key? key, this.rate = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numberOfStars = rate.round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(rate.toString(), style: greyFontStyle.copyWith(fontSize: 12),),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: List<Widget>.generate(5, (index) => Icon(
            MdiIcons.star,
            size: 9,
            color: (index < numberOfStars) ? mainColor : greyStar,
          )),
        )
      ]
    );
  }
}

