import 'package:flutter_bloc/flutter_bloc.dart';

/// 0 = Stories(), 1 = Bookmarks()
/// For simplicity I didn't create seperate enum
/// By default to Stories()
class ControllerCubit extends Cubit<int> {
  ControllerCubit() : super(0);

  void changePage(int index) => emit(index);
}
