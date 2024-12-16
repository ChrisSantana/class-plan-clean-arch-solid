import 'package:class_plan_flutter/core/bloc/factory_bloc.dart';
import 'package:class_plan_flutter/features/student/domain/entities/student_entity.dart';

class StudentTile extends StatelessWidget {
  final StudentEntity student;
  const StudentTile({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Nome: ${student.name}'),
              Text('Código: ${student.studentId}'),
              Text('Turma: ${student.classId}'),
            ],
          ),
        ),
      ),
    );
  }
}
