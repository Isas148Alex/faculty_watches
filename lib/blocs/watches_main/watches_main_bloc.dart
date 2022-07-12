///BLoC - соединяем логику событий и состояний

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../db/db_handler.dart';
import '../../models/faculty_info.dart';

part 'watches_main_event.dart';

part 'watches_main_state.dart';

class WatchesMainBloc extends Bloc<WatchesMainEvent, WatchesMainState> {
  WatchesMainBloc() : super(WatchesMainInitialState()) {
    //В данном случае только одно событие - старт экрана, но модуляризацию лучше использовать, так что логика вынесена
    on<WatchesMainStartedEvent>((event, emit) async {
      await _handleWatchesMainStartedEvent(event, emit);
    });
  }

  Future<void> _handleWatchesMainStartedEvent(
      WatchesMainStartedEvent event, Emitter emit) async {
    try {
      //Запускаем процесс получения данных
      emit(const WatchesMainLoadingState());
      List<FacultyInfo> info = [];
      await DataBaseHandler.getData(info);

      //Теперь указываем, что данные успешно считались
      emit(WatchesMainLoadedState(info));
    } catch (e) {
      //Ошибки отлавливаем и выводим(в идеале), переходим в нужное состояние
      emit(WatchesMainLoadFailedState(error: e));
    }
  }
}
