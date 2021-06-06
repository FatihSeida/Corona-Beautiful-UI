part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  const NavigationState({required this.dataMode});

  final DataMode dataMode;

  NavigationState copyWith({
    required DataMode dataMode,
  }) {
    return NavigationState(
      dataMode: dataMode,
    );
  }

  @override
  List<Object> get props => [dataMode];
}
