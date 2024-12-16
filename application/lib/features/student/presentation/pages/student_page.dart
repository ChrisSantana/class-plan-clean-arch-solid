import 'package:class_plan_flutter/core/entity/request_state_entity.dart';
import 'package:class_plan_flutter/core/widget/divider_widget.dart';
import 'package:class_plan_flutter/features/student/domain/entities/student_entity.dart';
import 'package:class_plan_flutter/features/student/presentation/bloc/student_bloc.dart';
import 'package:class_plan_flutter/features/student/presentation/bloc/student_factory_bloc.dart';
import 'package:class_plan_flutter/features/student/presentation/widgets/student_processing_widget.dart';
import 'package:class_plan_flutter/features/student/presentation/widgets/student_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentPage extends StatelessWidget {
  final String _classId;
  const StudentPage(this._classId, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StudentBloc>(
      create: StudentFactoryBloc().create,
      child: _StudentPage(_classId),
    );
  }
}

class _StudentPage extends StatefulWidget {
  final String _classId;
  const _StudentPage(this._classId);

  @override
  State<_StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<_StudentPage> {
  late final StudentBloc studentBloc;

  @override
  void initState() {
    super.initState();
    studentBloc = context.read<StudentBloc>();
    WidgetsBinding.instance.addPostFrameCallback(_addPostFrameCallback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estudantes'),
      ),
      body: BlocBuilder<StudentBloc, IRequestState<List<StudentEntity>>>(
        builder: (context, state) {
          if (state is RequestProcessingState) return StudentProgressingWidget();

          final List<StudentEntity> students = context.read<StudentBloc>().state.dataOrNull ?? [];

          return ListView.separated(
            itemCount: students.length,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            separatorBuilder: (context, index) {
              return DividerWidget(padding: const EdgeInsets.symmetric(vertical: 12), height: 0.5);
            },
            itemBuilder: (context, index) {
              return StudentTile(student: students.elementAt(index));
            },
          );
        },
      ),
    );
  }

  void _addPostFrameCallback(Duration _) async {
    await Future.delayed(Duration(seconds: 1));
    studentBloc.onRequestStudents(widget._classId);
  }
}
