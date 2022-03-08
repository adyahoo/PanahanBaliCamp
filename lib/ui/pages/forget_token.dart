part of 'pages.dart';

class ForgetTokenPage extends StatefulWidget {
  final String? email;

  const ForgetTokenPage({Key? key, this.email}) : super(key: key);

  @override
  _ForgetTokenPageState createState() => _ForgetTokenPageState();
}

class _ForgetTokenPageState extends State<ForgetTokenPage> {
  TextEditingController tokenController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Lupa Kata Sandi",
      subtitle: "Reset kata sandi akun anda",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text("Token Reset Password", style: blackFontStyle2),
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
              controller: tokenController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: "Masukan Token Anda",
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: EdgeInsets.fromLTRB(defaultMargin, 265, defaultMargin, 12),
            child: isLoading
                ? loadingIndicator
                : RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                    color: mainColor,
                    child: Text("Berikutnya",
                        style: blackFontStyle3.copyWith(
                            fontWeight: FontWeight.bold)),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await context
                          .bloc<UserCubit>()
                          .postForgetPassToken(tokenController.text);
                      var state = context.bloc<UserCubit>().state;

                      if (state is UserPostSuccess) {
                        snackbarSuccess(title: state.message!);
                        Get.off(ChangePasswordPage(
                          email: widget.email!,
                        ));
                      } else {
                        snackbarError(title: "Gagal Mengirim Token", subtitle: (state as UserLoadedFailed).message!);
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
