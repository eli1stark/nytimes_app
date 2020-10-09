/// Model of the Single Story from the API
class NYTStory {
  NYTStory({
    this.id,
    this.url,
    this.title,
    this.abstractText,
    this.publishedDate,
    this.imageSmallUrl,
    this.imageBigUrl,
  });

  final int id;
  final String url;
  final String title;
  final String abstractText;
  final String publishedDate;
  final String imageSmallUrl;
  final String imageBigUrl;
}

NYTStory nytStoryFromJson(Map story) {
  return NYTStory(
    id: story['id'],
    url: story['url'],
    title: story['title'],
    abstractText: story['abstractText'],
    publishedDate: story['publishedDate'],
    imageSmallUrl: story['imageSmallUrl'],
    imageBigUrl: story['imageBigUrl'],
  );
}

Map nytStoryToJson(NYTStory story) {
  return {
    'id': story.id,
    'url': story.url,
    'title': story.title,
    'abstractText': story.abstractText,
    'publishedDate': story.publishedDate,
    'imageSmallUrl': story.imageSmallUrl,
    'imageBigUrl': story.imageBigUrl,
  };
}
