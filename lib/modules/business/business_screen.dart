import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/news_cubit.dart';
import 'package:news/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        return ConditionalBuilder(
          builder: (BuildContext context) { 
            return ListView.separated( 
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildNewsItem(list[index],context), 
              separatorBuilder: (context, index) => separatorItem(),
              itemCount: list.length,
            );
          },
          condition: (state is! NewsGetBusinessLoading),
          fallback: (BuildContext context) => const Center(child: CircularProgressIndicator(color: Colors.deepOrange,)),
        );
      },
    );
  }
}

// var List = NewsCubit.get(context).business;

//         if (state is NewsGetBusinessLoading) {
//           return const Center(
//             child: CircularProgressIndicator(
//               color: Colors.deepOrange,
//             ),
//           );
//         } else if (state is NewsGetBusinessSuccess) {
//           if (List.isEmpty) {
//             return const Center(
//               child: Text('No articles found'),
//             );
//           } else {
//             return ListView.separated(
//               physics: BouncingScrollPhysics(),
//               itemBuilder: (context, index) => buildNewsItem(List[index]),
//               separatorBuilder: (context, index) => const SizedBox(
//                 height: 10,
//               ),
//               itemCount: List.length,
//             );
//           }
//         } else if (state is NewsGetBusinessFailure) {
//           return const Center(
//             child: Text('Error'),
//           );
//         } else {
//           return const BusinessScreen();
//         }