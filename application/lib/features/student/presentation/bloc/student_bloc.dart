import 'package:class_plan_flutter/core/entity/request_state_entity.dart';
import 'package:class_plan_flutter/core/library/constants.dart';
import 'package:class_plan_flutter/features/student/domain/entities/student_entity.dart';
import 'package:class_plan_flutter/features/student/domain/usecases/student_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentBloc extends Cubit<IRequestState<List<StudentEntity>>> {
  final IStudentUseCase _studentUseCase;

  StudentBloc(this._studentUseCase) : super(const RequestInitiationState<List<StudentEntity>>());

  Future<void> onRequestStudents(String classId) async {
    try {
      emit(const RequestProcessingState<List<StudentEntity>>());

      final List<StudentEntity> students = await _fetchStudentsFromClass(classId);

      emit(RequestCompletedState<List<StudentEntity>>(value: students));
    } catch (error) {
      emit(RequestErrorState<List<StudentEntity>>(error: error));
    }
  }

  Future<List<StudentEntity>> _fetchStudentsFromClass(String classId) {
    return switch (classId) {
      ClassConstant.idClassA => Future<List<StudentEntity>>.value(_studentUseCase.fetchStudentsFromClassA()),
      ClassConstant.idClassB => Future<List<StudentEntity>>.value(_studentUseCase.fetchStudentsFromClassB()),
      _ => Future<List<StudentEntity>>.value([]),
    };
  }
}
