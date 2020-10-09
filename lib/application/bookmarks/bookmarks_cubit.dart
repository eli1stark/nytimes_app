import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nytimes_app/domain/nyt_story.dart';

class BookmarksCubit extends HydratedCubit<List<NYTStory>> {
  BookmarksCubit() : super([]);

  void addBookmark(NYTStory bookmark) {
    state.add(bookmark);

    // I need to create a new list so
    // BlocBuilder and HydratedCubit react on the new state
    emit(List.of(state));
  }

  void deleteBookmark(NYTStory bookmark) {
    state.removeWhere(
      (element) => element.id == bookmark.id,
    );

    emit(List.of(state));
  }

  // Hydrated Cubit requires fromJson and toJson overrides
  @override
  List<NYTStory> fromJson(Map<String, dynamic> json) {
    List<NYTStory> newList = [];

    for (Map story in json['bookmarks']) {
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

    return {'bookmarks': newList};
  }
}
