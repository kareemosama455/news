import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/network/remote/dio_helper.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    floatingActionButton: FloatingActionButton(onPressed: (){
      DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'sports',
      'apiKey': '88909158b7aa4c96b4b2497b1d8b209d'
    }).then((onValue){
        if (kDebugMode) {
          print(onValue.data);
        }
      }).catchError((onError){
        if (kDebugMode) {
          print(onError.toString());
        }
      });
    }
    ),
    );
  }
}
