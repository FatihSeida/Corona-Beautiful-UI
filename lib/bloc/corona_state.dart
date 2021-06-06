part of 'corona_bloc.dart';

abstract class CoronaState extends Equatable {
  const CoronaState();
  @override
  List<Object> get props => [];
}

class CoronaStateLoading extends CoronaState {}

class CoronaStateLoaded extends CoronaState {
  const CoronaStateLoaded({
    required this.dataIndonesia,
    required this.dataPositifDunia,
    required this.dataSembuhDunia,
    required this.dataMeninggalDunia,
  });

  final DataIndonesia dataIndonesia;
  final String dataPositifDunia;
  final String dataSembuhDunia;
  final String dataMeninggalDunia;

  CoronaStateLoaded copyWith({
    required DataIndonesia dataIndonesia,
    required String dataPositifDunia,
    required String dataSembuhDunia,
    required String dataMeninggalDunia,
  }) {
    return CoronaStateLoaded(
      dataIndonesia: dataIndonesia,
      dataMeninggalDunia: dataMeninggalDunia,
      dataPositifDunia: dataPositifDunia,
      dataSembuhDunia: dataSembuhDunia,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      dataIndonesia,
      dataPositifDunia,
      dataSembuhDunia,
      dataMeninggalDunia,
    ];
  }
}

class CoronaStateError extends CoronaState {}
