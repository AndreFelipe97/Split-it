import 'package:flutter/widgets.dart';
import 'package:split_it/modules/login/login_services.dart';
import 'package:split_it/modules/login/login_state.dart';

class LoginController {
  LoginState state = LoginStateEmpty();
  VoidCallback onUpdate;
  final LoginService service;
  Function(LoginState state)? onChange;

  LoginController({required this.onUpdate, required this.service});

  Future<void> googleSignIn() async {
    try {
      state = LoginStateLoading();
      update();
      final user = await service.googleSignIn();
      state = LoginStateSuccess(user: user);
      update();
    } catch (error) {
      state = LoginStateFailure(message: error.toString());
      update();
    }
  }

  void update() {
    onUpdate();
    if (onChange != null) {
      onChange!(state);
    }
  }

  void list(Function(LoginState state) onChange) {
    this.onChange = onChange;
  }
}
