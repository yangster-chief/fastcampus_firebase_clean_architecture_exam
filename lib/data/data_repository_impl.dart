import 'package:fastcampus_firebase_clean_architecture_exam/data/data_source/auth_data_source.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/data/data_source/todo_data_source.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/data_repository.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/entity/todo_item.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/entity/user_profile.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/result.dart';
import 'package:fastcampus_firebase_clean_architecture_exam/domain/usecase/todo/dto/update_todo_dto.dart';
import 'package:injectable/injectable.dart';

///
/// fastcampus_firebase_clean_architecture_exam
/// File Name: data_repository_impl
/// Created by sujangmac
///
/// Description:
///
@Injectable(as: DataRepository)
class DataRepositoryImpl implements DataRepository {
  final AuthDataSource _authDataSource;
  final TodoDataSource _todoDataSource;

  const DataRepositoryImpl(this._authDataSource, this._todoDataSource);

  @override
  Future<Result<UserProfile>> login(String email, String password) =>
      executeSafe(() async {
        final user =
            await _authDataSource.signInWithEmailAndPassword(email, password);
        return UserProfile(
            uid: user.uid,
            name: user.displayName ?? '',
            email: user.email ?? '');
      });

  @override
  Future<Result<void>> logout() => executeSafe(() async {
        await _authDataSource.signOut();
      });

  @override
  Future<Result<UserProfile>> register(
          String email, String password, String name) =>
      executeSafe(() async {
        final user = await _authDataSource.registerUser(email, password, name);
        return UserProfile(
            uid: user.uid,
            name: user.displayName ?? '',
            email: user.email ?? '');
      });

  @override
  Future<Result<UserProfile>> getUser() => executeSafe(() async {
        final user = await _authDataSource.getCurrentUser();
        return UserProfile(
            uid: user.uid,
            name: user.displayName ?? '',
            email: user.email ?? '');
      });

  @override
  Future<Result<bool>> isLogin() => executeSafe(() async {
        final isSignedIn = await _authDataSource.isSignedIn();
        return isSignedIn;
      });

  @override
  Future<Result<void>> addTodoItem(String text) => executeSafe(() async {
        final userProfile = await _authDataSource.getCurrentUser();
        await _todoDataSource.addTodoItem(userProfile.uid, text);
      });

  @override
  Future<Result<List<TodoItem>>> getTodoItems() => executeSafe(() async {
        final userProfile = await _authDataSource.getCurrentUser();
        final todoItems = await _todoDataSource.getTodoItems(userProfile.uid);
        return todoItems;
      });

  @override
  Future<Result<void>> updateTodoItem(UpdateTodoDto dto) =>
      executeSafe(() async {
        final userProfile = await _authDataSource.getCurrentUser();
        await _todoDataSource.updateTodoItem(userProfile.uid, dto.id, dto.done);
      });

  @override
  Future<Result<void>> deleteTodoItem(String todoId) => executeSafe(() async {
        final userProfile = await _authDataSource.getCurrentUser();
        await _todoDataSource.deleteTodoItem(userProfile.uid, todoId);
      });
}
