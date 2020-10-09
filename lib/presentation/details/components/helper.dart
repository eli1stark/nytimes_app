import 'package:nytimes_app/domain/nyt_story.dart';

/// IF story is bookmarked function will return true else false
bool checkBookmark(NYTStory currentStory, List<NYTStory> bookmarks) {
  for (NYTStory bookmark in bookmarks) {
    if (currentStory.id == bookmark.id) {
      return true;
    }
  }
  return false;
}
