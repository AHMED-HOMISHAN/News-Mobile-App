import 'package:flutter/material.dart';
import 'package:newsapp/components/components.dart';
import 'package:newsapp/cubit/newsCubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var businessCubit = NewsCubit.get(context).bussinesArtical;
    return ConditionalBuilder(
      condition: businessCubit != null,
      builder: (BuildContext context) {
        return ListView.separated(
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: newsCard(
                      title: businessCubit[index]['title'],
                      image: businessCubit[index]['urlToImage'],
                      author: businessCubit[index]['author'],
                      time: businessCubit[index]['publishedAt'],
                      url: businessCubit[index]['url'],
                      context: context),
                ),
            separatorBuilder: (context, index) => const SizedBox(height: 2),
            itemCount: businessCubit!.length);
      },
      fallback: (BuildContext context) {
        return const Center(child: Text('لايوجد أخبار'));
      },
    );
  }
}
