import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:panahan_app/cubit/cubit.dart';
import 'package:panahan_app/models/models.dart';
import 'package:panahan_app/shared/shared.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'cubit/cart_cubit.dart';
import 'cubit/score_cubit.dart';
import 'ui/pages/pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool? status = await getLoginStatus();

  var directoryPath = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directoryPath.path);
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox('userBox');

  runApp(MyApp(status: status,));
}

class MyApp extends StatelessWidget {
  final bool? status;

  const MyApp({Key? key, this.status}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => ProvinceCubit()),
        BlocProvider(create: (_) => CityCubit()),
        BlocProvider(create: (_) => ArcherCubit()),
        BlocProvider(create: (_) => JadwalCubit()),
        BlocProvider(create: (_) => VenueCubit()),
        BlocProvider(create: (_) => PertandinganCubit()),
        BlocProvider(create: (_) => ScoreCubit()),
        BlocProvider(create: (_) => CartCubit()),
      ],
      child: GetMaterialApp(
        title: 'Panahan App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: status == true ? MainPage() : SignInPage(),
      ),
    );
  }
}
