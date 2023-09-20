import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/network/API/dioHelper.dart';
import 'package:newsapp/components/constant.dart';
import 'package:newsapp/cubit/newsCubit.dart';
import 'package:newsapp/layout/layoutScreen.dart';
import 'package:newsapp/network/local/cacheHelper.dart';
import 'package:newsapp/states/newsStates.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  bool isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(
    isDark,
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp(this.isDark, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getBusiness()
        ..getSport()
        ..getScience()
        ..toggleTheme(fromshared: isDark),
      child: BlocConsumer<NewsCubit, NewsStates>(
          builder: (context, state) {
            return MaterialApp(
             
              title: 'News App',
              debugShowCheckedModeBanner: false,
              darkTheme: ThemeData(
                primaryColor: Colors.white,
                cardColor: Colors.white,
                textTheme: const TextTheme(
                  bodyLarge: TextStyle(fontSize: 15, color: Colors.white),
                ),
                scaffoldBackgroundColor: HexColor('333739'),
                canvasColor: Colors.white,
                appBarTheme: AppBarTheme(
                    color: HexColor('202124'),
                    elevation: 0.0,
                    iconTheme: const IconThemeData(color: Colors.white),
                    titleTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25),
                    scrolledUnderElevation: 0.0),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    elevation: 1.0,
                    showUnselectedLabels: false,
                    backgroundColor: HexColor('202124'),
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.grey),
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
                useMaterial3: true,
              ),
              theme: ThemeData(
                textTheme: const TextTheme(
                  bodyLarge: TextStyle(fontSize: 15, color: primaryColor),
                ),
                iconTheme: const IconThemeData(color: primaryColor),
                canvasColor: Colors.white,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                    titleTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        fontSize: 25),
                    color: Colors.white,
                    elevation: 0.0,
                    scrolledUnderElevation: 0.0),
                primaryColor: primaryColor,
                cardColor: primaryColor,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    elevation: 0.0,
                    showUnselectedLabels: false,
                    backgroundColor: Colors.white,
                    selectedItemColor: primaryColor,
                    unselectedItemColor: Colors.grey),
                colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
                useMaterial3: true,
              ),
              themeMode: NewsCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: const Directionality(
                  textDirection: TextDirection.rtl, child: LayoutScreen()),
            );
          },
          listener: (context, state) {}),
    );
  }
}
