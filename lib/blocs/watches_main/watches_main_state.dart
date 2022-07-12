///Описываем состояния, в котором может быть экран

part of 'watches_main_bloc.dart';

abstract class WatchesMainState extends Equatable {
  const WatchesMainState();
}

abstract class WatchesMainInfoState extends WatchesMainState {
  final List<FacultyInfo> info;

  const WatchesMainInfoState({required this.info});

  @override
  List<Object> get props => [info];
}

//Начальное состояние
class WatchesMainInitialState extends WatchesMainState {
  @override
  List<Object> get props => [];
}

//Состояние загрузки данных
class WatchesMainLoadingState extends WatchesMainState {
  const WatchesMainLoadingState();

  @override
  List<Object> get props => [];
}

//Состояние, когда данные успешно загрузились
class WatchesMainLoadedState extends WatchesMainInfoState {
  const WatchesMainLoadedState(info) : super(info: info);

  @override
  List<Object> get props => [info];
}

//Состояние ошибки, когда что-то пошло не так (напр. нет интернета)
class WatchesMainLoadFailedState extends WatchesMainState {
  final Object error;

  const WatchesMainLoadFailedState({required this.error});

  @override
  List<Object> get props => [error];
}
