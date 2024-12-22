import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/business/business_screen.dart';
import 'package:news/modules/science/science_screen.dart';
import 'package:news/modules/sports/sports_screen.dart';
import 'package:news/network/local/cache.dart';
import 'package:news/network/remote/dio_helper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    // const BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
  ];
  List<Widget> screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen(),
    // const SettingScreen()
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) {
      getScience();
    }
    if (index == 2) {
      getSports();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  void getBussines() {
    emit(NewsGetBusinessLoading());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '88909158b7aa4c96b4b2497b1d8b209d'
    }).then((onValue) {
      business = onValue.data['articles'];
      // print(business[0]['title']);
      emit(NewsGetBusinessSuccess());
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError.toString());
      }
      emit(NewsGetBusinessFailure(message: onError.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoading());
    if (sports.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': '88909158b7aa4c96b4b2497b1d8b209d'
      }).then((onValue) {
        sports = onValue.data['articles'];
        // print(business[0]['title']);
        emit(NewsGetSportsSuccess());
      }).catchError((onError) {
        if (kDebugMode) {
          print(onError.toString());
        }
        emit(NewsGetSportsFailure(message: onError.toString()));
      });
    } else {
      emit(NewsGetSportsSuccess());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoading());
    if (science.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'science',
        'apiKey': '88909158b7aa4c96b4b2497b1d8b209d'
      }).then((onValue) {
        science = onValue.data['articles'];
        // print(business[0]['title']);
        emit(NewsGetScienceSuccess());
      }).catchError((onError) {
        if (kDebugMode) {
          print(onError.toString());
        }
        emit(NewsGetScienceFailure(message: onError.toString()));
      });
    } else {
      emit(NewsGetScienceSuccess());
    }
  }

  bool isDark = false;
  void changeTheme() {
    isDark = !isDark;
    CacheHelper.putData(key: 'isDark', value: isDark).then((onValue){
    emit(ChangeNewsAppTheme());
    });

  }
}
