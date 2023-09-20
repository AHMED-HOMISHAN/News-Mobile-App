// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/network/API/dioHelper.dart';
import 'package:newsapp/network/local/cacheHelper.dart';
import 'package:newsapp/pages/businessScreen.dart';
import 'package:newsapp/pages/scienceScreen.dart';
import 'package:newsapp/pages/sportScreen.dart';
import 'package:newsapp/states/newsStates.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  bool isDark = false;

  List<dynamic>? bussinesArtical;
  List<dynamic>? sportArtical;
  List<dynamic>? scienceArtical;
  List<dynamic>? result;

  List<Widget> screens = const [
    SportScreen(),
    BusinessScreen(),
    ScienceScreen(),
  ];

  void changePage(int index) {
    currentIndex = index;

    emit(NewsbottomNavgaitionState());
  }

  void getBusiness() {
    emit(NewsLoadingState());
    DioHelper.getDate(category: 'business').then((value) {
      bussinesArtical = value.data['articles'];
      emit(NewsBusinessSuccessState());
    }).catchError((error) {
      emit(NewsBusinessErrorState());
    });
  }

  void getSport() {
    emit(NewsLoadingState());
    DioHelper.getDate(category: 'sport').then((value) {
      sportArtical = value.data['articles'];
      emit(NewsSportSuccessState());
    }).catchError((error) {
      emit(NewsSportErrorState());
    });
  }

  void getScience() {
    emit(NewsLoadingState());
    DioHelper.getDate(category: 'science').then((value) {
      scienceArtical = value.data['articles'];
      emit(NewsScienceSuccessState());
    }).catchError((error) {
      emit(NewsScienceErrorState());
    });
  }

  void toggleTheme({bool? fromshared}) {
    if (fromshared != null) {
      isDark = fromshared;
      emit(NewsThemeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark)
          .then((value) => emit(NewsThemeModeState()));
    }
  }

  void search(String value) {
    emit(NewsSerachLoadingState());
    DioHelper.getDate(search: value, url: 'v2/everything', country: '')
        .then((value) {
      result = value.data['articles'];
      print(result);
      emit(NewsSearchSuccessState());
    }).catchError((error) {
      print(error);
      emit(NewsSearchErrorState());
    });
  }
}
