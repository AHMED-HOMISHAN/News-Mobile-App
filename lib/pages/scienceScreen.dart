import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/components/components.dart';
import 'package:newsapp/cubit/newsCubit.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var scienceCubit = NewsCubit.get(context).scienceArtical;
    return ConditionalBuilder(
      condition: scienceCubit != null,
      builder: (BuildContext context) {
        return ListView.separated(
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: newsCard(
                      title: scienceCubit[index]['title'],
                      image: scienceCubit[index]['urlToImage'],
                      author: scienceCubit[index]['author'],
                      time: scienceCubit[index]['publishedAt'],
                      url: scienceCubit[index]['url'],
                      context: context),
                ),
            separatorBuilder: (context, index) => const SizedBox(height: 2),
            itemCount: scienceCubit!.length);
      },
      fallback: (BuildContext context) {
        return const Center(child: Text('لايوجد أخبار'));
      },
    );
  }
}
