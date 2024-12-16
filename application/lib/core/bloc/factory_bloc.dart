import 'package:flutter/material.dart';

export 'package:class_plan_flutter/core/library/injection_container.dart';
export 'package:class_plan_flutter/core/service/app_service.dart';
export 'package:flutter/material.dart';

abstract interface class IFactoryBloc<T> {
  T create(BuildContext context);
  void dispose(BuildContext context, T bloc);
}
