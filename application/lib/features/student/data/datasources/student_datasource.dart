import 'package:class_plan_flutter/core/entity/http_response_entity.dart';
import 'package:class_plan_flutter/core/library/constants.dart';
import 'package:class_plan_flutter/core/service/http_client.dart';
import 'package:class_plan_flutter/features/student/domain/entities/student_entity.dart';

const String kUrlBase = 'http://localhost:3000';
const String kUrlClassA = '/students-class-a';
const String kUrlClassB = '/students-class-b';

abstract interface class IStudentDataSource {
  Future<List<StudentEntity>>? fetchStudentsFromClassA();
  Future<List<StudentEntity>>? fetchStudentsFromClassB();
}

final class StudentDataSource implements IStudentDataSource {
  final IHttpClient _httpClient;
  const StudentDataSource(this._httpClient);

  @override
  Future<List<StudentEntity>> fetchStudentsFromClassA() async {
    try {
      final HttpResponseEntity httpResponse = await _httpClient.get('$kUrlBase$kUrlClassA')!;
      return _createStudentsFromHttpResponse(httpResponse);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<StudentEntity>> fetchStudentsFromClassB() async {
    try {
      final HttpResponseEntity httpResponse = await _httpClient.get('$kUrlBase$kUrlClassB')!;
      return _createStudentsFromHttpResponse(httpResponse);
    } catch (_) {
      rethrow;
    }
  }

  Future<List<StudentEntity>> _createStudentsFromHttpResponse(HttpResponseEntity httpResponse) async {
    return httpResponse.toSuccess() ? (httpResponse.data as List).map<StudentEntity>((map) => StudentEntity.fromMap(map)).toList() : [];
  }
}

extension _HttpExtension on HttpResponseEntity {
  bool toSuccess() {
    return ((statusCode ?? 0) >= HttpConstant.kSuccess) && ((statusCode ?? 0) <= HttpConstant.kSuccessLimit);
  }
}
