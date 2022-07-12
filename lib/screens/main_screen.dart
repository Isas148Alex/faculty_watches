///Главный экран приложения с часами

import 'package:faculty_watches/models/faculty_info.dart';
import 'package:faculty_watches/screens/change_screen.dart';
import 'package:faculty_watches/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/watches_main/watches_main_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScaffoldBody(context),
    );
  }

  Widget _buildScaffoldBody(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          //Без фона было совсем грустно, а мне только это пришло в голову
          image: AssetImage("assets/background_image.png"),
          fit: BoxFit.cover,
        )),
        child: BlocBuilder<WatchesMainBloc, WatchesMainState>(
            builder: (context, state) {
          //Основное разбиение логики - обработка состояний
          if (state is WatchesMainInitialState ||
              state is WatchesMainLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is WatchesMainLoadedState) {
            return _buildWatchesInfo(state, context);
          }
          if (state is WatchesMainLoadFailedState) {
            return const Center(child: Text(TextConstant.error));
          }
          //Вот этот текст по идее не должен появиться никогда, если все состояния
          //обработаны, но на случай расширения его лучше оставить, чтобы точно
          //не забыть обработать все возвожные стейты
          return const Center(child: Text(TextConstant.somethingWentWrong));
        }));
  }

  //Тут построение "основной" части
  Widget _buildWatchesInfo(WatchesMainLoadedState state, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
            onTap: () {
              _onTap(context, state.info, 0);
            },
            child: FAProgressBar(
              backgroundColor: const Color.fromRGBO(255, 255, 255, 0.8),
              direction: Axis.vertical,
              verticalDirection: VerticalDirection.up,
              currentValue: state.info[0].getValue() * 1.0,
              borderRadius: BorderRadius.circular(5),
              progressColor: Colors.green,
            )),
        InkWell(
            onTap: () {
              _onTap(context, state.info, 1);
            },
            child: FAProgressBar(
              backgroundColor: const Color.fromRGBO(255, 255, 255, 0.8),
              direction: Axis.vertical,
              verticalDirection: VerticalDirection.up,
              currentValue: state.info[1].getValue() * 1.0,
              borderRadius: BorderRadius.circular(5),
              progressColor: Colors.blueAccent,
            )),
        InkWell(
            onTap: () {
              _onTap(context, state.info, 2);
            },
            child: FAProgressBar(
              backgroundColor: const Color.fromRGBO(255, 255, 255, 0.8),
              direction: Axis.vertical,
              verticalDirection: VerticalDirection.up,
              currentValue: state.info[2].getValue() * 1.0,
              borderRadius: BorderRadius.circular(5),
              progressColor: Colors.red,
            )),
        InkWell(
            onTap: () {
              _onTap(context, state.info, 3);
            },
            child: FAProgressBar(
              backgroundColor: const Color.fromRGBO(255, 255, 255, 0.8),
              direction: Axis.vertical,
              verticalDirection: VerticalDirection.up,
              currentValue: state.info[3].getValue() * 1.0,
              borderRadius: BorderRadius.circular(5),
              progressColor: Colors.yellow,
            )),
      ],
    );
  }

  void _onTap(BuildContext context, List<FacultyInfo> info, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChangeScreen(info: info[index]),
        ));
  }
}
