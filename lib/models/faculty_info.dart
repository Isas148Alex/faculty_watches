///Модель данных, содержит описание модели и возможности взаимодействия с ней

class FacultyInfo {
  late String _name;
  late int _id;
  late int _value;

  String getName() {
    return _name;
  }

  int getId() {
    return _id;
  }

  int getValue() {
    return _value;
  }

  void changeValue(int changes) {
    _value += changes;
    if (_value < 0) {
      _value = 0;
    } else if (_value > 100) {
      _value = 100;
    }
  }

  FacultyInfo(this._name, this._id, this._value);
}
