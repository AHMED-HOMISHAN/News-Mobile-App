import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/components/components.dart';
import 'package:newsapp/cubit/newsCubit.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var sportCubit = NewsCubit.get(context).sportArtical;
    return ConditionalBuilder(
      condition: sportCubit != null,
      builder: (BuildContext context) {
        return ListView.separated(
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: newsCard(
                      title: sportCubit[index]['title'],
                      image: sportCubit[index]['urlToImage'],
                      author: sportCubit[index]['author'],
                      time: sportCubit[index]['publishedAt'],
                      url: sportCubit[index]['url'],
                      context: context),
                ),
            separatorBuilder: (context, index) => const SizedBox(height: 2),
            itemCount: sportCubit!.length);
      },
      fallback: (BuildContext context) {
        return Center(
            child: Text(
          'لايوجد أخبار',
          style: Theme.of(context).textTheme.bodyLarge,
        ));
      },
    );
  }
}
