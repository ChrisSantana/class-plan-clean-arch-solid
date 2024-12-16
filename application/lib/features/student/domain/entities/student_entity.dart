import 'package:equatable/equatable.dart';

final class StudentEntity extends Equatable {
  final String classId;
  final String studentId;
  final String name;

  const StudentEntity({
    required this.classId,
    required this.studentId,
    required this.name,
  });

  factory StudentEntity.fromMap(Map<String, dynamic> map) {
    return StudentEntity(
      classId: map[kKeyClassId],
      studentId: map[kKeyStudentId],
      name: map[kKeyName],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      kKeyStudentId: studentId,
      kKeyClassId: classId,
      kKeyName: name,
    };
  }

  static const String kKeyStudentId = 'id';
  static const String kKeyClassId = 'classId';
  static const String kKeyName = 'name';

  @override
  List<Object?> get props => [classId, studentId, name];
}
