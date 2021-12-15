import 'package:matrix_game/data/models/user_model.dart';

import 'authentication_metodos.dart';

class AuthManagement {
  PasswordAuth auth = PasswordAuth();

  Future<UserModel?> getLoggedUser() async {
    return await auth.getLoggedUser();
  }

  Future<UserModel?> signIn(
      {required String email, required String password}) async {
    try {
      return await auth.signIn(email: email, password: password);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<bool> signUp({
    required String name,
    required String email,
    required String password,
    required String nick,
  }) async {
    try {
      var user = UserModel(
          name: name,
          nickName: nick,
          email: email,
          password: password,
          avatarLink:
              'https://media.admagazine.com/photos/618a6acbcc7069ed5077ca7f/master/w_1600%2Cc_limit/68704.jpg');
      auth.signUp(userModel: user);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> signOut() async {
    try {
      return await auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
