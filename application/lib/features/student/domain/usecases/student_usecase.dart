import 'package:class_plan_flutter/features/student/domain/entities/student_entity.dart';
import 'package:class_plan_flutter/features/student/domain/repositories/student_repository.dart';

abstract interface class IStudentUseCase {
  Future<List<StudentEntity>> fetchStudentsFromClassA();
  Future<List<StudentEntity>> fetchStudentsFromClassB();
}

final class StudentUseCase implements IStudentUseCase {
  final IStudentRepository _studentRepository;
  const StudentUseCase(this._studentRepository);

  @override
  Future<List<StudentEntity>> fetchStudentsFromClassA() {
    return Future<List<StudentEntity>>.value(_studentRepository.fetchStudentsFromClassA());
  }

  @override
  Future<List<StudentEntity>> fetchStudentsFromClassB() {
    return Future<List<StudentEntity>>.value(_studentRepository.fetchStudentsFromClassB());
  }
}
