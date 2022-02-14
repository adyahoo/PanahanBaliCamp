part of 'widgets.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index)? onTap;

  const CustomBottomNavbar({Key? key, this.selectedIndex = 0, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel user = getUserData();

    return Container(
      width: double.infinity,
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(0);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/ic_home" + ((selectedIndex == 0) ? ".png" : "_normal.png")),
                    fit: BoxFit.contain,
                  )
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(1);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              margin: EdgeInsets.symmetric(horizontal: 59),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/ic_archer" + ((selectedIndex == 1) ? ".png" : "_normal.png")),
                    fit: BoxFit.contain,
                  )
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(2);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              margin: EdgeInsets.only(right: 59),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/ic_order" + ((selectedIndex == 2) ? ".png" : "_normal.png")),
                    fit: BoxFit.contain,
                  )
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(3);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    // image: NetworkImage(profpicUrl+(context.bloc<UserCubit>().state as UserLoaded).user!.image!),
                    image: NetworkImage(profpicUrl+user.image!),
                    fit: BoxFit.cover,
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}

