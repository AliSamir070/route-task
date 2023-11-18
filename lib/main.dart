import 'package:flutter/material.dart';
import 'package:twasol/core/api/api_manager.dart';

import 'core/DI/dependency_injection.dart';
import 'core/utils/blocObserver.dart';
import 'my_app.dart';
import 'package:bloc/bloc.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  ApiManager.init();
  configureDependencies();
  runApp(const MyApp());
}



