import 'package:flutter/material.dart';
import 'package:nytimes_app/domain/nyt_story.dart';
import 'package:nytimes_app/presentation/components/story_bookmark_frame.dart';

class Bookmark extends StatelessWidget {
  const Bookmark(this.story);

  final NYTStory story;

  @override
  Widget build(BuildContext context) {
    return StoryBookmarkFrame(
      story: story,
      child: Container(
        padding: EdgeInsets.all(
          5.0,
        ),
        alignment: Alignment.topLeft,
        child: Text(
          story.title,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
