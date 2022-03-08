part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Masuk",
      subtitle: "Akses fitur eksklusif Member Club",
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
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
              "Kata Sandi",
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
              controller: passController,
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: "Masukkan Kata Sandi"),
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isLoading
                ? loadingIndicator
                : RaisedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      await context
                          .bloc<UserCubit>()
                          .login(emailController.text, passController.text);
                      UserState state = context.bloc<UserCubit>().state;

                      if (state is UserLoaded) {
                        snackbarSuccess(title: "Login Success");

                        Get.to(MainPage());
                      } else {
                        snackbarError(
                            title: "Login Failed",
                            subtitle: (state as UserLoadedFailed).message!);
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: mainColor,
                    child: Text(
                      "Masuk",
                      style: blackFontStyle3,
                    ),
                  ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: EdgeInsets.only(top: 12, bottom: 12),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isLoading
                ? SpinKitFadingCircle(
                    color: mainColor,
                    size: 45,
                  )
                : RaisedButton(
                    onPressed: () {
                      context.bloc<ProvinceCubit>().getProvinces();
                      Get.to(SignUpPage());
                    },
                    color: secondColor,
                    elevation: 0,
                    child: Text("Daftar Akun Baru",
                        style: GoogleFonts.poppins()
                            .copyWith(color: Colors.white)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
          ),
          GestureDetector(
              onTap: () {
                Get.to(ForgetPasswordPage());
              },
              child: Text("Lupa Password?"))
        ],
      ),
    );
  }
}
