part of 'corona_bloc.dart';

abstract class CoronaEvent extends Equatable {
  const CoronaEvent();

  @override
  List<Object> get props => [];
}

class FetchDataIndonesia extends CoronaEvent {}

// class FetchDataSembuh extends CoronaEvent {}

// class FetchDataPositif extends CoronaEvent {}

// class FetchDataMeninggal extends CoronaEvent {}
