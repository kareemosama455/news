import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/news_cubit.dart';
import 'package:news/shared/components/components.dart';
class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).science;
        return ConditionalBuilder(
          builder: (BuildContext context) { 
            return ListView.separated( 
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildNewsItem(list[index],context), 
              separatorBuilder: (context, index) => separatorItem(),
              itemCount: list.length,
            );
          },
          condition: (state is! NewsGetScienceLoading),
          fallback: (BuildContext context) => const CircularProgressIndicator(),
        );
      },
    );
  }
}
