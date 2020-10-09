import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes_app/application/stories/stories_cubit.dart';
import 'package:nytimes_app/domain/nyt_story.dart';
import 'components/story.dart';

class Stories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create 'StoriesCubit' instance
    final StoriesCubit storiesCubit = BlocProvider.of<StoriesCubit>(context);

    return BlocBuilder<StoriesCubit, List<NYTStory>>(
      builder: (context, state) {
        if (state.isNotEmpty) {
          return RefreshIndicator(
            onRefresh: () => storiesCubit.refresh(),
            child: ListView(
              children: [
                for (NYTStory story in state) Story(story),
              ],
            ),
          );
        } else {
          // I will see this Indicator only once
          // when I first open the app, next interactions(launches) with
          // the app will be without loading since all data cached
          // by using Hydrated Bloc which is using Hive(NoSql db).
          // Refresh will happen behind the scene
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.black,
            ),
          );
        }
      },
    );
  }
}
