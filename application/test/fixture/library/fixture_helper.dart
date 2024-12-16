import 'dart:convert';

import 'package:class_plan_flutter/core/library/constants.dart';
import 'package:class_plan_flutter/features/student/domain/entities/student_entity.dart';

import 'fixture_reader.dart';

final class FixtureHelper {
  static List<StudentEntity> fetchStudentsClassA() {
    return fetchStudentsMap()
        .map<StudentEntity>((map) => StudentEntity.fromMap(map))
        .where((student) => student.classId.toUpperCase() == ClassConstant.idClassA.toUpperCase())
        .toList();
  }

  static List<StudentEntity> fetchStudentsClassB() {
    return fetchStudentsMap()
        .map<StudentEntity>((map) => StudentEntity.fromMap(map))
        .where((student) => student.classId.toUpperCase() == ClassConstant.idClassB.toUpperCase())
        .toList();
  }

  static List<Map<String, dynamic>> fetchStudentsMap() {
    return (jsonDecode(fixture('students.json')) as List).map((map) => map as Map<String, dynamic>).toList();
  }
}
