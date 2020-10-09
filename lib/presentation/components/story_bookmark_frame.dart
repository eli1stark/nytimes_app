import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes_app/application/bookmarks/bookmarks_cubit.dart';
import 'package:nytimes_app/domain/nyt_story.dart';
import 'package:nytimes_app/presentation/details/details.dart';

class StoryBookmarkFrame extends StatelessWidget {
  const StoryBookmarkFrame({
    Key key,
    @required this.story,
    @required this.child,
  }) : super(key: key);

  final NYTStory story;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              // Passing Provider to the Navigator
              builder: (_) => BlocProvider.value(
                value: BlocProvider.of<BookmarksCubit>(context),
                child: Details(
                  story: story,
                ),
              ),
            ),
          );
        },
        child: Row(
          children: [
            if (story.imageSmallUrl == null)
              Container(
                height: 75.0,
                width: 75.0,
                child: Image.asset(
                  'assets/icon.png',
                ),
              )
            else
              // Cache image to increase response of the App
              CachedNetworkImage(
                imageUrl: story.imageSmallUrl,
                fadeInCurve: Curves.easeIn,
              ),
            Expanded(
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
