import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nytimes_app/application/controller/controller_cubit.dart';
import 'package:nytimes_app/application/stories/stories_cubit.dart';
import 'package:nytimes_app/presentation/bookmarks/bookmarks.dart';
import 'package:nytimes_app/presentation/stories/stories.dart';

final List<Widget> _pages = [
  Stories(),
  Bookmarks(),
];

class Controller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create 'ControllerCubit' instance
    final ControllerCubit controllerCubit =
        BlocProvider.of<ControllerCubit>(context);

    // Create 'StoriesCubit' instance
    final StoriesCubit storiesCubit = BlocProvider.of<StoriesCubit>(context);

    // at every launch of the app (once per launch)
    storiesCubit.refresh();

    return BlocBuilder<ControllerCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: _pages[state],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state,
            items: [
              BottomNavigationBarItem(
                label: 'Stories',
                icon: Icon(
                  FontAwesomeIcons.newspaper,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Bookmarks',
                icon: Icon(
                  FontAwesomeIcons.bookmark,
                ),
              ),
            ],
            onTap: (newIndex) => controllerCubit.changePage(newIndex),
          ),
        );
      },
    );
  }
}
