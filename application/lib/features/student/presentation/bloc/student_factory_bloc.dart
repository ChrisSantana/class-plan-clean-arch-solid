import 'package:class_plan_flutter/core/bloc/factory_bloc.dart';
import 'package:class_plan_flutter/core/service/http_client.dart';
import 'package:class_plan_flutter/features/student/data/datasources/student_datasource.dart';
import 'package:class_plan_flutter/features/student/data/repositories/student_repository.dart';
import 'package:class_plan_flutter/features/student/domain/repositories/student_repository.dart';
import 'package:class_plan_flutter/features/student/domain/usecases/student_usecase.dart';
import 'package:class_plan_flutter/features/student/presentation/bloc/student_bloc.dart';

final class StudentFactoryBloc implements IFactoryBloc<StudentBloc> {
  const StudentFactoryBloc();

  @override
  StudentBloc create(BuildContext context) {
    return StudentBloc(
      StudentFactoryUseCase().create(),
    );
  }

  @override
  void dispose(BuildContext context, StudentBloc bloc) {
    bloc.close();
  }
}

final class StudentFactoryUseCase {
  IStudentUseCase create() {
    return StudentUseCase(StudentFactoryRepository().create());
  }
}

final class StudentFactoryRepository {
  IStudentRepository create() {
    final IHttpClient httpClient = HttpClientFactory().createHttpClient();
    final IStudentDataSource studentDataSource = StudentDataSource(httpClient);
    return StudentRepository(studentDataSource);
  }
}
