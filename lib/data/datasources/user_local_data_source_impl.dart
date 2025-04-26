import 'package:learn_with_me/data/models/user_model.dart';

import 'package:learn_with_me/data/models/user_model.dart';

import 'user_local_datasource.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  @override
  Future<UserModel> authenticateUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(
      id: 'guest_user_id',
      name: 'Guest User',
      email: 'guest@example.com',
    );
  }
  
  @override
  Future<UserModel> loginAnonymously() async {
    await Future.delayed(const Duration(seconds: 1));
    return const UserModel(
      id: 'anonymous_user_id',
      name: 'Anonymous User',
      email: 'anonymous@example.com',
    );
  }
}