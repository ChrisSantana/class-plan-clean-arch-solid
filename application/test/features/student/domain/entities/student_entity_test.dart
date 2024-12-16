import 'package:class_plan_flutter/features/student/domain/entities/student_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixture/library/fixture_helper.dart';

void main() {
  test('should valid student entity from toMap and fromMap', () {
    /// Arrange
    final List<Map<String, dynamic>> studentsMap = FixtureHelper.fetchStudentsMap();

    /// Act
    final StudentEntity student = StudentEntity.fromMap(studentsMap.first);
    final Map<String, dynamic> map = student.toMap();

    /// Assert
    expect(map, studentsMap.first);
  });
}
