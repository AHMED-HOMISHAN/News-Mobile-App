import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/newsCubit.dart';
import 'package:newsapp/pages/searchScreen.dart';
import 'package:newsapp/states/newsStates.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          var cubit = NewsCubit.get(context);

          return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'الاخبار',
                ),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SearchScreen()));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(
                        cubit.isDark ? Icons.dark_mode_outlined : Icons.sunny,
                      ),
                      onPressed: () {
                        cubit.toggleTheme();
                      },
                    ),
                  )
                ],
              ),
              body: ConditionalBuilder(
                condition: state is! NewsLoadingState,
                builder: (context) => cubit.screens[cubit.currentIndex],
                fallback: (BuildContext context) =>
                    const Center(child: CircularProgressIndicator()),
              ),
              bottomNavigationBar: BottomNavigationBar(
                  onTap: (index) {
                    cubit.changePage(index);
                  },
                  currentIndex: cubit.currentIndex,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.sports_soccer_sharp,
                        ),
                        label: 'الرياضة'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.business_center_outlined),
                        label: 'الاعمال'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.science_outlined), label: 'العلوم'),
                  ]));
        },
        listener: (context, state) {});
  }
}
