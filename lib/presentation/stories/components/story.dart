import 'package:flutter/material.dart';
import 'package:nytimes_app/domain/nyt_story.dart';
import 'package:nytimes_app/presentation/components/story_bookmark_frame.dart';

class Story extends StatelessWidget {
  const Story(this.story);

  final NYTStory story;

  @override
  Widget build(BuildContext context) {
    return StoryBookmarkFrame(
      story: story,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              story.title,
              maxLines: 2,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                story.publishedDate,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
