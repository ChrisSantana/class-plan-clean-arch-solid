import 'package:class_plan_flutter/core/library/constants.dart';
import 'package:class_plan_flutter/features/student/data/datasources/student_datasource.dart';
import 'package:class_plan_flutter/features/student/data/repositories/student_repository.dart';
import 'package:class_plan_flutter/features/student/domain/entities/student_entity.dart';
import 'package:class_plan_flutter/features/student/domain/repositories/student_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixture/library/fixture_helper.dart';

final class _MockStudentDataSource extends Mock implements IStudentDataSource {}

void main() {
  late final IStudentRepository tStudentRepository;
  late final IStudentDataSource tStudentDatSource;
  late final List<StudentEntity> tStudentsA;
  late final List<StudentEntity> tStudentsB;

  setUpAll(() {
    tStudentDatSource = _MockStudentDataSource();
    tStudentsA = FixtureHelper.fetchStudentsClassA();
    tStudentsB = FixtureHelper.fetchStudentsClassB();
    tStudentRepository = StudentRepository(tStudentDatSource);
  });

  test('should students of class A from data source', () async {
    /// Arrange
    when(tStudentDatSource.fetchStudentsFromClassA()).thenAnswer((_) async => tStudentsA);

    /// Act
    final studentsClassA = await tStudentRepository.fetchStudentsFromClassA()!;

    /// Assert
    expect(studentsClassA, isNotEmpty);
    expect(studentsClassA.first.classId.toUpperCase(), ClassConstant.idClassA.toUpperCase());
    verify(tStudentDatSource.fetchStudentsFromClassA()).called(1);
    verifyNoMoreInteractions(tStudentDatSource);
  });

  test('should students of class B from data source', () async {
    /// Arrange
    when(tStudentDatSource.fetchStudentsFromClassB()).thenAnswer((_) async => tStudentsB);

    /// Act
    final studentsClassB = await tStudentRepository.fetchStudentsFromClassB()!;

    /// Assert
    expect(studentsClassB, isNotEmpty);
    expect(studentsClassB.first.classId.toUpperCase(), ClassConstant.idClassB.toUpperCase());
    verify(tStudentDatSource.fetchStudentsFromClassB()).called(1);
    verifyNoMoreInteractions(tStudentDatSource);
  });
}
