part of 'pages.dart';

class ChangePasswordPage extends StatefulWidget {
  final String? email;

  const ChangePasswordPage({Key? key, this.email}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController newPassController = TextEditingController();
  TextEditingController confPassController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
        title: "Lupa Kata Sandi",
        subtitle: "Reset kata sandi akun anda",
        onBackButtonPressed: () {
          Get.back();
        },
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 12, defaultMargin, 6),
            child: Text("Kata Sandi Baru", style: blackFontStyle2),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              obscureText: true,
              controller: newPassController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: "Masukan Kata Sandi Baru",
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 12, defaultMargin, 6),
            child: Text("Konfirmasi Kata Sandi Baru", style: blackFontStyle2),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              obscureText: true,
              controller: confPassController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: "Masukan Kata Sandi Baru Kembali",
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: EdgeInsets.fromLTRB(defaultMargin, 24, defaultMargin, 0),
            child: isLoading
                ? loadingIndicator
                : RaisedButton(
                    color: mainColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text("Simpan",
                        style: blackFontStyle3.copyWith(
                            fontWeight: FontWeight.bold)),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      if (newPassController.text != confPassController.text) {
                        snackbarError(
                            title: "Gagal Mengubah Password",
                            subtitle:
                                "Password Baru dan Konfirmasi Password Tidak Sama");
                        setState(() {
                          isLoading = false;
                        });
                      } else {
                        await context.bloc<UserCubit>().resetPassword(
                            widget.email!,
                            newPassController.text,
                            confPassController.text);
                        var state = context.bloc<UserCubit>().state;

                        if (state is UserPostSuccess) {
                          snackbarSuccess(title: state.message!);
                          Get.off(SuccessResetPassPage());
                        } else {
                          snackbarError(
                              title: "Gagal Mengubah Kata Sandi",
                              subtitle: (state as UserLoadedFailed).message!);
                          setState(() {
                            isLoading = false;
                          });
                        }
                      }
                    },
                  ),
          ),
        ]));
  }
}
