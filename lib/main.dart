import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/app_cubit/cubit.dart';
import 'package:la_vie/app_cubit/states.dart';

import 'package:la_vie/layout/SignupAndIn/SignupAndIn_layout.dart';
import 'package:la_vie/layout/home/home_layout.dart';
import 'package:la_vie/shared/bloc_observer/bloc_observer.dart';
import 'package:la_vie/shared/dio/dio_helper.dart';
import 'package:la_vie/shared/shared_preference/shared_preferences.dart';

import 'shared/constants/access_token.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CashHelper.init();
  Widget widget;
  accessToken = CashHelper.getData(key: 'accessToken');

  if (accessToken != null) {
    widget=HomeLayout();
  } else {
    widget = SignupAndInLayout();
  }
  BlocOverrides.runZoned(
    () {
      runApp(MyApp(startWidget: widget,));
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {

  final Widget startWidget;

  const MyApp({Key key, this.startWidget}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return

      MultiBlocProvider(
        providers: [
          BlocProvider(create:
              (context) => AppCubit()..getPlants()..getTools()..getSeeds()..getBlogs()..getMyForums()..getALLForums())

        ],
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return
            MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'La Vie',
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                    backgroundColor: Colors.white, elevation: 0, centerTitle: true),
                scaffoldBackgroundColor: Color(0xfff7f7f7),
              ),
              home: startWidget);
          },
        ),
      );

  }
}
