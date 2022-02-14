import 'dart:io';
import 'dart:math';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:panahan_app/cubit/archer_cubit.dart';
import 'package:panahan_app/cubit/city_cubit.dart';
import 'package:panahan_app/cubit/jadwal_cubit.dart';
import 'package:panahan_app/cubit/pertandingan_cubit.dart';
import 'package:panahan_app/cubit/province_cubit.dart';
import 'package:panahan_app/cubit/user_cubit.dart';
import 'package:panahan_app/cubit/venue_cubit.dart';
import 'package:panahan_app/models/models.dart';
import 'package:panahan_app/shared/shared.dart';
import 'package:panahan_app/ui/widgets/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'general_page.dart';
part 'sign_in_page.dart';
part 'sign_up_page.dart';
part 'address_page.dart';
part 'main_page.dart';
part 'home_page.dart';
part 'archer_detail_page.dart';
part 'forget_password.dart';
part 'change_password.dart';
part 'payment_page.dart';
part 'illustration_page.dart';
part 'archery_page.dart';
part 'score_page.dart';
part 'add_score_page.dart';
part 'profile_page.dart';
part 'scanqr_page.dart';
part 'accountqr_page.dart';
part 'success_sign_up_page.dart';
part 'success_order_page.dart';
part 'empty_order_page.dart';
part 'cart_page.dart';
part 'order_list_page.dart';
part 'order_detail_page.dart';
part 'payment_info_page.dart';
part 'idcard_page.dart';

Future<bool?> getLoginStatus () async {
  final pref = await SharedPreferences.getInstance();
  var status = pref.getBool("isLogin") ?? false;

  return status;
}

UserModel getUserData() {
  var userBox = Hive.box('userBox');
  UserModel user = userBox.getAt(0);

  return user;
}