import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:covid_beautiful_ui/enums.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(dataMode: DataMode.indonesia));

  void changeDataMode(DataMode dataMode) {
    if (dataMode != state.dataMode) {
      emit(state.copyWith(dataMode: dataMode));
    }
  }
}
