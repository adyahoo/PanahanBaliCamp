part of 'widgets.dart';

class CustomTabbar extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function(int)? onTap;

  const CustomTabbar({Key? key, this.selectedIndex = 0, required this.titles, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          //garis abu-abu di tabbar
          Container(
            margin: EdgeInsets.only(top: 48),
            height: 1,
            color: 'F2F2F2'.toColor(),
          ),
          //list titles
          Container(
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: titles.map((e) => Padding(
                    padding: EdgeInsets.only(
                        left: (titles.indexOf(e) == 0) ? defaultMargin : 16,
                        right: (e == titles.last) ? defaultMargin : 0
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //title of tab
                        GestureDetector(
                          onTap: () {
                            if (onTap != null) {
                              onTap!(titles.indexOf(e));
                            }
                          },
                          child: Text(e,
                            style: (titles.indexOf(e) == selectedIndex) ? secondColorFontStyle : greyFontStyle,
                          ),
                        ),
                        //indicator selected tab
                        Container(
                          width: 60,
                          height: 3,
                          margin: EdgeInsets.only(top: 13),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.5),
                            color: (titles.indexOf(e) == selectedIndex) ? secondColor : Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  )).toList(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
