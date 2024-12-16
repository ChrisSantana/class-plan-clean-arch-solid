import 'package:class_plan_flutter/features/student/domain/entities/student_entity.dart';

abstract interface class IStudentRepository {
  Future<List<StudentEntity>>? fetchStudentsFromClassA();
  Future<List<StudentEntity>>? fetchStudentsFromClassB();
}
