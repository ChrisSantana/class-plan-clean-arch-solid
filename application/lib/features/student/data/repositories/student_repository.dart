import 'package:class_plan_flutter/features/student/data/datasources/student_datasource.dart';
import 'package:class_plan_flutter/features/student/domain/entities/student_entity.dart';
import 'package:class_plan_flutter/features/student/domain/repositories/student_repository.dart';

final class StudentRepository implements IStudentRepository {
  final IStudentDataSource _studentDataSource;
  const StudentRepository(this._studentDataSource);

  @override
  Future<List<StudentEntity>> fetchStudentsFromClassA() {
    return Future<List<StudentEntity>>.value(_studentDataSource.fetchStudentsFromClassA());
  }

  @override
  Future<List<StudentEntity>> fetchStudentsFromClassB() {
    return Future<List<StudentEntity>>.value(_studentDataSource.fetchStudentsFromClassB());
  }
}
