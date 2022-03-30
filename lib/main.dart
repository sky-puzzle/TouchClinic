
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touch_clinic/layout/cubit/shop_cubit.dart';
import 'package:touch_clinic/layout/lay_out.dart';
import 'package:touch_clinic/login/login_screen.dart';
import 'package:touch_clinic/register/register_screen.dart';
import 'package:touch_clinic/shared/block.dart';
import 'package:touch_clinic/shared/constants.dart';

import 'layout/details.dart';
import 'layout/favorites.dart';
import 'layout/section1.dart';
import 'layout/settinngs.dart';
import 'ntework/cache_helper.dart';
import 'ntework/dio_helper.dart';
import 'on_boarding/on_boarding.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
   await CacheHelper.init();
   Widget widget;
   dynamic onBoarding = CacheHelper.getData(
     key: 'onBoarding',
   );
     token =  CacheHelper.getData(key:'token');

   if (onBoarding !=null) {
     if (token != null) {
       widget = HomeLayOut();
     } else {
       widget = LoginScreen();
     }
   } else {
     widget = const OnBoarding();
   }
  runApp(  MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
    MyApp(
      this.startWidget
    ) ;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()..GetAds()..MyAppoint(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Jannah',
          scaffoldBackgroundColor: Colors.grey[200],
        ),
        home: Builder(builder: (BuildContext context) {
          return MediaQuery(data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1
          ), child: startWidget);
        },

        )
      ),
    );
  }
}
