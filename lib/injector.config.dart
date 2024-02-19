// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fastcampus_firebase_clean_architecture_exam/data/data_repository_impl.dart'
    as _i7;
import 'package:fastcampus_firebase_clean_architecture_exam/data/data_source/auth_data_source.dart'
    as _i5;
import 'package:fastcampus_firebase_clean_architecture_exam/data/data_source/todo_data_source.dart'
    as _i4;
import 'package:fastcampus_firebase_clean_architecture_exam/di/app_module.dart'
    as _i16;
import 'package:fastcampus_firebase_clean_architecture_exam/di/firebase_service.dart'
    as _i3;
import 'package:fastcampus_firebase_clean_architecture_exam/domain/data_repository.dart'
    as _i6;
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/auth/check_is_login_usecase.dart'
    as _i15;
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/auth/get_user_usecase.dart'
    as _i10;
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/auth/login_usecase.dart'
    as _i11;
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/auth/register_usecase.dart'
    as _i12;
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/todo/add_todo_item_usecase.dart'
    as _i14;
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/todo/delete_todo_item_usecase.dart'
    as _i8;
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/todo/get_todo_items_usecase.dart'
    as _i9;
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/todo/update_todo_item_usecase.dart'
    as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i3.FirebaseService>(
      () => appModule.firebaseService,
      preResolve: true,
    );
    gh.singleton<_i4.TodoDataSource>(
        _i4.TodoDataSource(gh<_i3.FirebaseService>()));
    gh.singleton<_i5.AuthDataSource>(
        _i5.AuthDataSource(gh<_i3.FirebaseService>()));
    gh.factory<_i6.DataRepository>(() => _i7.DataRepositoryImpl(
          gh<_i5.AuthDataSource>(),
          gh<_i4.TodoDataSource>(),
        ));
    gh.factory<_i8.DeleteTodoItemUseCase>(
        () => _i8.DeleteTodoItemUseCase(gh<_i6.DataRepository>()));
    gh.factory<_i9.GetTodoItemsUseCase>(
        () => _i9.GetTodoItemsUseCase(gh<_i6.DataRepository>()));
    gh.factory<_i10.GetUserUseCase>(
        () => _i10.GetUserUseCase(gh<_i6.DataRepository>()));
    gh.factory<_i11.LoginUseCase>(
        () => _i11.LoginUseCase(gh<_i6.DataRepository>()));
    gh.factory<_i12.RegisterUseCase>(
        () => _i12.RegisterUseCase(gh<_i6.DataRepository>()));
    gh.factory<_i13.UpdateTodoItemUseCase>(
        () => _i13.UpdateTodoItemUseCase(gh<_i6.DataRepository>()));
    gh.factory<_i14.AddTodoItemUseCase>(
        () => _i14.AddTodoItemUseCase(gh<_i6.DataRepository>()));
    gh.factory<_i15.CheckIsLoginUseCase>(
        () => _i15.CheckIsLoginUseCase(gh<_i6.DataRepository>()));
    return this;
  }
}

class _$AppModule extends _i16.AppModule {}
