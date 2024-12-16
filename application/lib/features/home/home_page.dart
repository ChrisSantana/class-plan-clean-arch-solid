import 'package:class_plan_flutter/core/bloc/factory_bloc.dart';
import 'package:class_plan_flutter/core/library/constants.dart';
import 'package:class_plan_flutter/core/widget/text_extension_widget.dart';
import 'package:class_plan_flutter/features/student/presentation/pages/student_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dispositivos Móveis'),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: EdgeInsets.only(bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Clean Architecture e SOLID com Flutter',
            ).font16W500(textAlign: TextAlign.center),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Escolher a turma ',
                ).font14W500(textAlign: TextAlign.center),
                _ButtonWidget(
                  title: 'Turma A',
                  onPressed: _onPressedClassA,
                  padding: const EdgeInsets.only(top: 20, bottom: 12),
                ),
                _ButtonWidget(
                  title: 'Turma B',
                  onPressed: _onPressedClassB,
                ),
              ],
            ),
            Spacer(),
            Text('UniCesumar - Maringá-PR')
                .font14W500(textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  void _onPressedClassA() {
    _onNavigateTo(ClassConstant.idClassA);
  }

  void _onPressedClassB() {
    _onNavigateTo(ClassConstant.idClassB);
  }

  void _onNavigateTo(String classId) {
    getIt<IAppService>().navigateTo(StudentPage(classId));
  }
}

class _ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final EdgeInsets? padding;

  const _ButtonWidget({
    required this.title,
    required this.onPressed,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.sizeOf(context).width * 0.8, 50),
          side: BorderSide(
            color: Colors.grey.shade800,
            width: 2,
          ),
        ),
        child: Text(title),
      ),
    );
  }
}
