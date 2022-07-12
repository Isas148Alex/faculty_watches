///Класс для работы с БД.

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/faculty_info.dart';

class DataBaseHandler {
  static Future<void> getData(List<FacultyInfo> info) async {
    var snapshot = await FirebaseFirestore.instance
        .collection('faculties')
        .snapshots()
        .first;
    for (var doc in snapshot.docs) {
      info.add(
          FacultyInfo(doc.get('name'), int.parse(doc.id), doc.get('value')));
    }
  }

  static void updateDataBase(FacultyInfo info) {
    FirebaseFirestore.instance
        .collection('faculties')
        .doc(info.getId().toString())
        .update({'value': info.getValue()});
  }
}
