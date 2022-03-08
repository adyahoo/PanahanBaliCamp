part of 'widgets.dart';

class Venue extends StatelessWidget {
  final VenueModel venue;
  final Function buttonMap;

  const Venue({Key? key, required this.venue, required this.buttonMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                margin: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: NetworkImage(venuespicUrl + venue.image!),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(venue.name!, style: blackFontStyle2,),
                  Container(
                      width: 180,
                      child: Text(
                        venue.address!,
                        style: greyFontStyle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      )
                  ),
                  Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: secondColor,
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Text(venue.totalActivity.toString() + " Activities", style: greyFontStyle.copyWith(color: Colors.white, fontSize: 8),)
                  ),
                ],
              ),
            ],
          ),
          Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage("assets/images/pin.png"),
                  fit: BoxFit.none,
                )
              )
          )
        ],
      )
    );
  }
}
