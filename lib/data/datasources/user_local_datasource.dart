import '../models/user_model.dart';

abstract class UserLocalDataSource {
    Future<UserModel> authenticateUser();
    Future<UserModel> loginAnonymously();
}