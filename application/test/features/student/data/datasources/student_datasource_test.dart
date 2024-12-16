import 'package:class_plan_flutter/core/entity/http_response_entity.dart';
import 'package:class_plan_flutter/core/library/constants.dart';
import 'package:class_plan_flutter/core/service/http_client.dart';
import 'package:class_plan_flutter/features/student/data/datasources/student_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixture/library/fixture_helper.dart';

final class _MockHttpClient extends Mock implements IHttpClient {}

void main() {
  late final IStudentDataSource tStudentDataSource;
  late final IHttpClient tHttpClient;
  late final List<Map<String, dynamic>> tStudentsMap;
  late final String tUrlClassA;
  late final String tUrlClassB;

  setUpAll(() {
    tHttpClient = _MockHttpClient();
    tStudentsMap = FixtureHelper.fetchStudentsMap();
    tStudentDataSource = StudentDataSource(tHttpClient);
    tUrlClassA = '$kUrlBase$kUrlClassA';
    tUrlClassB = '$kUrlBase$kUrlClassB';
  });

  test('should students of class A from API', () async {
    /// Arrange
    when(tHttpClient.get(tUrlClassA)).thenAnswer((_) async => HttpResponseEntity(statusCode: HttpConstant.kSuccess, data: tStudentsMap));

    /// Act
    final studentsClassA = await tStudentDataSource.fetchStudentsFromClassA();

    /// Assert
    expect(studentsClassA, isNotEmpty);
    verify(tHttpClient.get(tUrlClassA)).called(1);
    verifyNoMoreInteractions(tHttpClient);
  });

  test('should students of class B from API', () async {
    /// Arrange
    when(tHttpClient.get(tUrlClassB)).thenAnswer((_) async => HttpResponseEntity(statusCode: HttpConstant.kSuccess, data: tStudentsMap));

    /// Act
    final studentsClassB = await tStudentDataSource.fetchStudentsFromClassB();

    /// Assert
    expect(studentsClassB, isNotEmpty);
    verify(tHttpClient.get(tUrlClassB)).called(1);
    verifyNoMoreInteractions(tHttpClient);
  });
}
