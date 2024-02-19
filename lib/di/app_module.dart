import 'package:fastcampus_firebase_clean_architecture_exam/di/firebase_service.dart';
import 'package:injectable/injectable.dart';

///
/// fastcampus_firebase_clean_architecture_exam
/// File Name: app_module
/// Created by sujangmac
///
/// Description:
///
@module
abstract class AppModule {
  @preResolve
  Future<FirebaseService> get firebaseService => FirebaseService.init();
}
