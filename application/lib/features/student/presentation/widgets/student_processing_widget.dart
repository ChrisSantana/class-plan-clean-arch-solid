import 'package:flutter/material.dart';
import 'package:class_plan_flutter/core/widget/shimmer_widget.dart';

class StudentProgressingWidget extends StatelessWidget {
  const StudentProgressingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget.fromColors(
      baseColor: Colors.grey.shade900,
      highlightColor: Colors.grey.shade700,
      child: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ContainerMockWidget(),
              _ContainerMockWidget(),
              _ContainerMockWidget(),
              _ContainerMockWidget(),
              _ContainerMockWidget(),
              _ContainerMockWidget(),
              _ContainerMockWidget(),
              _ContainerMockWidget(),
              _ContainerMockWidget(),
              _ContainerMockWidget(),
              _ContainerMockWidget(),
              _ContainerMockWidget(),
              _ContainerMockWidget(),
              _ContainerMockWidget(),
              _ContainerMockWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContainerMockWidget extends StatelessWidget {
  const _ContainerMockWidget();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(height: 46),
      ),
    );
  }
}
