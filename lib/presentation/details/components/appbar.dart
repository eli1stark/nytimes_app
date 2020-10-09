import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nytimes_app/application/bookmarks/bookmarks_cubit.dart';
import 'package:nytimes_app/domain/nyt_story.dart';
import 'custom_icon.dart';
import 'helper.dart';

class DetailsAppBar extends StatefulWidget {
  DetailsAppBar(this.story);

  final NYTStory story;

  @override
  _DetailsAppBarState createState() => _DetailsAppBarState();
}

class _DetailsAppBarState extends State<DetailsAppBar> {
  @override
  Widget build(BuildContext context) {
    // Create 'BookmarksCubit' instance
    final BookmarksCubit bookmarksCubit =
        BlocProvider.of<BookmarksCubit>(context);

    return AppBar(
      backgroundColor: Colors.white,
      leading: CustomIconButton(
        icon: Icons.arrow_back,
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        CustomIconButton(
          icon: checkBookmark(widget.story, bookmarksCubit.state)
              ? FontAwesomeIcons.solidBookmark
              : FontAwesomeIcons.bookmark,
          onPressed: () {
            // update State
            if (checkBookmark(widget.story, bookmarksCubit.state)) {
              bookmarksCubit.deleteBookmark(widget.story);
            } else {
              bookmarksCubit.addBookmark(widget.story);
            }
            // update Icon
            setState(() {});
          },
        ),
      ],
    );
  }
}
