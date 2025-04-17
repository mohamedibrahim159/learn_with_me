import 'user_local_datasource.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  @override
  Future<Map<String, dynamic>> authenticateUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return {
      'id': 'guest_user_id',
      'name': 'Guest User',
      'email': 'guest@example.com',
    };
  }
}