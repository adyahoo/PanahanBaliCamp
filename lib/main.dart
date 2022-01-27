import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:panahan_app/cubit/cubit.dart';

import 'ui/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit())
      ],
      child: GetMaterialApp(
        title: 'Panahan App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignInPage(),
      ),
    );
  }
}
