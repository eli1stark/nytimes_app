import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nytimes_app/domain/nyt_story.dart';
import 'package:nytimes_app/infrastructure/api/methods.dart';

class StoriesCubit extends HydratedCubit<List<NYTStory>> {
  StoriesCubit() : super([]);

  Future<void> refresh() async {
    // Declare new List
    List<NYTStory> newList = [];

    // Get response from the API
    Map response = await getTopStoriesofDay();

    // Iterate through response and add stories
    // to the custom List
    if (response != null) {
      for (Map story in response['results']) {
        NYTStory nytStory = NYTStory(
          id: story['id'],
          url: story['url'],
          title: story['title'],
          abstractText: story['abstract'],
          publishedDate: story['published_date'],
          imageSmallUrl: story['media'].isEmpty
              ? null
              : story['media'][0]['media-metadata'][0]['url'],
          imageBigUrl: story['media'].isEmpty
              ? null
              : story['media'][0]['media-metadata'][2]['url'],
        );

        newList.add(nytStory);
      }
    }
    emit(newList);
  }

  // Hydrated Cubit requires fromJson and toJson overrides
  @override
  List<NYTStory> fromJson(Map<String, dynamic> json) {
    List<NYTStory> newList = [];

    for (Map story in json['stories']) {
      newList.add(nytStoryFromJson(story));
    }

    return newList;
  }

  @override
  Map<String, dynamic> toJson(state) {
    List<Map> newList = [];

    for (NYTStory story in state) {
      newList.add(nytStoryToJson(story));
    }

    return {'stories': newList};
  }
}
