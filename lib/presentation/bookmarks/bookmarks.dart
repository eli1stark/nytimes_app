import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes_app/application/bookmarks/bookmarks_cubit.dart';
import 'package:nytimes_app/domain/nyt_story.dart';
import 'components/bookmark.dart';
import 'components/no_content.dart';

class Bookmarks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarksCubit, List<NYTStory>>(
      builder: (context, state) {
        if (state.isNotEmpty) {
          return GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(5.0),
            childAspectRatio: (100 / 42),
            children: [
              for (NYTStory story in state) Bookmark(story),
            ],
          );
        } else {
          return NoContent();
        }
      },
    );
  }
}
