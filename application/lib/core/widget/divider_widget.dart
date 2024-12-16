import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final double? width;
  final double height;
  final Color? color;
  final EdgeInsets? padding;
  final bool showWidget;

  const DividerWidget({
    super.key,
    this.width,
    this.height = 1,
    this.color,
    this.padding,
    this.showWidget = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!showWidget) return const Offstage();
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        width: width ?? MediaQuery.sizeOf(context).width,
        height: height,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              color: color ?? Colors.grey.shade700,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
