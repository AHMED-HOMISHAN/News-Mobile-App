import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/components/components.dart';
import 'package:newsapp/components/constant.dart';
import 'package:newsapp/cubit/newsCubit.dart';
import 'package:newsapp/states/newsStates.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          var searchCubit = NewsCubit.get(context).result;
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    defaultForm(
                        controller: searchController,
                        type: TextInputType.text,
                        prefixIcon: Icons.search,
                        label: 'Search',
                        onChange: (value) {
                          NewsCubit.get(context).search(value);
                        },
                        suffixIconPressed: () {}),
                    const SizedBox(
                      height: 50,
                    ),
                    ConditionalBuilder(
                      condition: searchCubit != null,
                      builder: (context) => Expanded(
                        child: ListView.separated(
                            padding: const EdgeInsets.all(0),
                            itemBuilder: (context, index) => newsCard(
                                title: searchCubit[index]['title'],
                                image: searchCubit[index]['urlToImage'],
                                author:
                                    searchCubit[index]['author'] ?? "No author",
                                time: searchCubit[index]['publishedAt'],
                                url: searchCubit[index]['url'],
                                context: context),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 20),
                            itemCount: searchCubit!.length),
                      ),
                      fallback: (BuildContext context) => const Center(
                          child: CircularProgressIndicator(
                        color: primaryColor,
                      )),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
