///Текстовые литералы вынесены для более простого ведения + возможности перевода
///Переменная dummy используется как заглушка, а её вынесение в класс позволяет
///без проблем найти её использование по всему коду. Используется на этапе
///разработки и в конечной версии её использований быть не должно.

class TextConstant {
  static const String dummy = "Заглушка";
  static const String facultyWatches = "Факультетские часы";
  static const String increase = "Добавить";
  static const String decrease = "Вычесть";
  static const String inputScore = "Введите количество баллов";
  static const String error = "Во время загрузки произошла ошибка";
  static const String somethingWentWrong = "Что-то пошло не так";
}