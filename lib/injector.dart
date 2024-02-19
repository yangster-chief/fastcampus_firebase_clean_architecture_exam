import 'package:fastcampus_firebase_clean_architecture_exam/injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

///
/// fastcampus_firebase_clean_architecture_exam
/// File Name: injector
/// Created by sujangmac
///
/// Description:
///
final locator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() => locator.init();
