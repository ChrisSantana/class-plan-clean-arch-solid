// coverage:ignore-file
import 'package:get_it/get_it.dart';
import 'package:class_plan_flutter/core/bloc/factory_bloc.dart';

final GetIt getIt = GetIt.instance;

void init() {
  /// #region AppService
  getIt.registerSingleton<IAppService>(AppService(GlobalKey<NavigatorState>()));
}
