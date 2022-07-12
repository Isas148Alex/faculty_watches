///Экран внесения изменений. На вход принимает данные о факультете

import 'package:faculty_watches/blocs/watches_main/watches_main_bloc.dart';
import 'package:faculty_watches/db/db_handler.dart';
import 'package:faculty_watches/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/faculty_info.dart';

class ChangeScreen extends StatelessWidget {
  final TextEditingController changeValue = TextEditingController();
  final FacultyInfo info;

  ChangeScreen({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildScaffoldAppBar(context),
      body: _buildScaffoldBody(context),
    );
  }

  AppBar _buildScaffoldAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey,
      centerTitle: true,
      title: Text(info.getName()),
    );
  }

  Widget _buildScaffoldBody(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          //Без фона было совсем грустно, а мне только это пришло в голову
          image: AssetImage("assets/background_image_2.png"),
          fit: BoxFit.cover,
        )),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.7)),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: TextConstant.inputScore),
                controller: changeValue,
                //Для удобства сразу открываем клавиатуру с цифрами
                keyboardType: TextInputType.number,
                //Вот это свойство позволяет вводить только цифры, но защиту от дурака всё равно нужно расширить (ниже)
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.7)),
                    child: IconButton(
                      onPressed: () {
                        _onButtonSaveClick(context, 1);
                      },
                      icon: const Icon(Icons.add, color: Colors.green),
                      tooltip: TextConstant.increase,
                    )),
                Container(
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.7)),
                    child: IconButton(
                        onPressed: () {
                          _onButtonSaveClick(context, -1);
                        },
                        icon: const Icon(Icons.remove, color: Colors.red),
                        tooltip: TextConstant.decrease)),
              ],
            )
          ],
        )));
  }

  //Действия при нажатии на одну из кнопок, sign - знак количества, 1 - плюс, -1 - минус
  void _onButtonSaveClick(BuildContext context, int sign) {
    //TryParse прописан для краевых моментов - пустое поле ввода и значение, превышающее int
    int num = int.tryParse(changeValue.text) ?? 0;
    //Изменяем значение
    info.changeValue(sign * num);
    //И сразу записываем в БД
    DataBaseHandler.updateDataBase(info);
    //Добавляем событие запуска экрана, чтобы данные подтянулись с БД и всё было актуально
    context.read<WatchesMainBloc>().add(const WatchesMainStartedEvent());

    Navigator.of(context).pop();
  }
}
