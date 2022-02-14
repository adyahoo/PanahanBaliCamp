import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:panahan_app/cubit/cubit.dart';
import 'package:panahan_app/models/models.dart';
import 'package:panahan_app/shared/shared.dart';
import 'package:supercharged/supercharged.dart';
import 'package:intl/intl.dart';

part 'custom_bottom_navbar.dart';
part 'custom_tabbar.dart';
part 'rating_card_stars.dart';
part 'rating_stars.dart';
part 'item_card.dart';
part 'item_archer_list.dart';
part 'jadwal.dart';
part 'venue.dart';
part 'pertandingan.dart';
part 'score_list.dart';
part 'dropdown.dart';
part 'item_cart.dart';
part 'item_order.dart';

UserModel getUserData() {
  var userBox = Hive.box('userBox');
  UserModel user = userBox.getAt(0);

  return user;
}