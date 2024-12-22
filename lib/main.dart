import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/cubit/news_cubit.dart';
import 'package:news/layout/news_layout.dart';
import 'package:news/network/local/cache.dart';
import 'package:news/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp(this.isDark, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBussines(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                primaryColor: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.orange),
                textTheme: const TextTheme(
                    bodyLarge: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black))),
            darkTheme: ThemeData(
                primarySwatch: Colors.deepOrange,
                primaryColor: Colors.deepOrange,
                scaffoldBackgroundColor: HexColor('212121'),
                appBarTheme: AppBarTheme(
                  backgroundColor: HexColor('212121'),
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('212121'),
                      statusBarIconBrightness: Brightness.light),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.orange,
                    backgroundColor: HexColor('212121'),
                    unselectedItemColor: Colors.grey,
                    elevation: 20),
                textTheme: const TextTheme(
                    bodyLarge: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white))),
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
