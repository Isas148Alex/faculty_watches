///Расписываем события BLoC'а для главного экрана

part of 'watches_main_bloc.dart';

abstract class WatchesMainEvent extends Equatable {
  const WatchesMainEvent();
}

class WatchesMainStartedEvent extends WatchesMainEvent {
  const WatchesMainStartedEvent();

  @override
  List<Object?> get props => [];
}
