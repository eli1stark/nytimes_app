import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'application/bookmarks/bookmarks_cubit.dart';
import 'application/controller/controller_cubit.dart';
import 'application/stories/stories_cubit.dart';
import 'presentation/controller/controller.dart';

void main() async {
  // Hydrated storage initialization
  WidgetsFlutterBinding.ensureInitialized();
  HydratedCubit.storage = await HydratedStorage.build(
    // By default, all data is written to temporary storage which
    // means it can be wiped by the operating system at any point in time.
    // An optional storageDirectory can be provided to override the
    // default temporary storage directory:
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // disable horizontal View
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ControllerCubit(),
        ),
        BlocProvider(
          create: (context) => StoriesCubit(),
        ),
        BlocProvider(
          create: (context) => BookmarksCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.black,
          accentColor: Colors.grey,
        ),
        home: Controller(),
      ),
    );
  }
}
