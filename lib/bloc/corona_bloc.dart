import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:covid_beautiful_ui/models/data_corona.dart';
import 'package:covid_beautiful_ui/repository/repository.dart';

part 'corona_event.dart';
part 'corona_state.dart';

class CoronaBloc extends Bloc<CoronaEvent, CoronaState> {
  CoronaBloc(
    this.dataCoronaRepository,
  ) : super(CoronaStateLoading());

  final DataCoronaRepository dataCoronaRepository;

  @override
  Stream<CoronaState> mapEventToState(
    CoronaEvent event,
  ) async* {
    if (event is FetchDataIndonesia) {
      yield* _mapFetchDataIndonesiaToState(state);
    }
  }

  Stream<CoronaState> _mapFetchDataIndonesiaToState(CoronaState state) async* {
    try {
      final dataIndonesiaResult = await dataCoronaRepository.fetchData();
      final dataPositifDunia =
          await dataCoronaRepository.fetchDataPositifDunia();
      var dataSembuhDunia = await dataCoronaRepository.fetchDataSembuhDunia();
      var dataMeninggalDunia =
          await dataCoronaRepository.fetchDataMeninggalDunia();
      yield CoronaStateLoaded(
          dataIndonesia: dataIndonesiaResult,
          dataMeninggalDunia: dataPositifDunia,
          dataPositifDunia: dataSembuhDunia,
          dataSembuhDunia: dataMeninggalDunia);
    } catch (e) {
      yield CoronaStateError();
    }
  }
}
