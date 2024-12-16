import 'package:class_plan_flutter/core/library/constants.dart';
import 'package:class_plan_flutter/features/student/domain/entities/student_entity.dart';
import 'package:class_plan_flutter/features/student/domain/repositories/student_repository.dart';
import 'package:class_plan_flutter/features/student/domain/usecases/student_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixture/library/fixture_helper.dart';

final class _MockStudentRepository extends Mock implements IStudentRepository {}

void main() {
  late final IStudentUseCase tStudentUseCase;
  late final IStudentRepository tStudentRepository;
  late final List<StudentEntity> tStudentsA;
  late final List<StudentEntity> tStudentsB;

  setUpAll(() {
    tStudentRepository = _MockStudentRepository();
    tStudentsA = FixtureHelper.fetchStudentsClassA();
    tStudentsB = FixtureHelper.fetchStudentsClassB();
    tStudentUseCase = StudentUseCase(tStudentRepository);
  });

  test('should students of class A from repository', () async {
    /// Arrange
    when(tStudentRepository.fetchStudentsFromClassA()).thenAnswer((_) async => tStudentsA);

    /// Act
    final studentsClassA = await tStudentUseCase.fetchStudentsFromClassA();

    /// Assert
    expect(studentsClassA, isNotEmpty);
    expect(studentsClassA.first.classId.toUpperCase(), ClassConstant.idClassA.toUpperCase());
    verify(tStudentRepository.fetchStudentsFromClassA()).called(1);
    verifyNoMoreInteractions(tStudentRepository);
  });

  test('should students of class B from repository', () async {
    /// Arrange
    when(tStudentRepository.fetchStudentsFromClassB()).thenAnswer((_) async => tStudentsB);

    /// Act
    final studentsClassB = await tStudentUseCase.fetchStudentsFromClassB();

    /// Assert
    expect(studentsClassB, isNotEmpty);
    expect(studentsClassB.first.classId.toUpperCase(), ClassConstant.idClassB.toUpperCase());
    verify(tStudentRepository.fetchStudentsFromClassB()).called(1);
    verifyNoMoreInteractions(tStudentRepository);
  });
}
