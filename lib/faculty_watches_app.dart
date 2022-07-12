///Основа нашего приложения
///
import 'package:faculty_watches/blocs/watches_main/watches_main_bloc.dart';
import 'package:faculty_watches/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:faculty_watches/text_constants.dart';

class FacultyWatchesApp extends StatelessWidget {
  const FacultyWatchesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Указываем, какие BLoC'и должны храниться в контексте (в данном случае один,
    //но может пригодится второй, если на втором экране логики станет больше) и добавляем немного настроек
    //таких как дебаг баннер, тема и т.д. В теории, понятное дело, можно много всего другого накрутить
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                WatchesMainBloc()..add(const WatchesMainStartedEvent())),
      ],
      child: MaterialApp(
        title: TextConstant.facultyWatches,
        theme: ThemeData.light(),
        home: const MainScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
