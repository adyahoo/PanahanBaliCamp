part of 'widgets.dart';

class RatingStar extends StatelessWidget {
  final double rate;

  const RatingStar({Key? key, this.rate = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int numberOfStars = rate.round();

    return Row(
      children: List<Widget>.generate(5, (index) => Icon(
        MdiIcons.star,
        color: (index < numberOfStars) ? mainColor : greyStar,
        size: 16,
      )) + [
        SizedBox(width: 4, height: 4,),
        Text(rate.toString())
      ],
    );
  }
}

