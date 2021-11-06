import 'package:flutter_test/flutter_test.dart';
import 'package:split_it/modules/login/login_cotroller.dart';
import 'package:split_it/modules/login/login_services.dart';
import 'package:split_it/modules/login/login_state.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:mocktail/mocktail.dart';

class LoginServiceMock extends Mock implements LoginService {}

void main() {
  late LoginController controller;
  late LoginService service;

  setUp(() {
    service = LoginServiceMock();
    controller = LoginController(service: service, onUpdate: () {});
  });

  test("Testando o google SignIn retornando sucesso", () async {
    expect(controller.state, isInstanceOf<LoginStateEmpty>());
    final states = <LoginState>[];
    controller.list((state) => states.add(state));
    when(service.googleSignIn).thenAnswer((_) async => UserModel(
        email: "andrefeliperf17@gmail.com", id: "1", name: "André Felipe"));
    await controller.googleSignIn();
    expect(states[0], isInstanceOf<LoginStateLoading>());
    expect(states[1], isInstanceOf<LoginStateSuccess>());
    expect(states.length, 2);
  });

  test("Testando o google SignIn retornando falha", () async {
    expect(controller.state, isInstanceOf<LoginStateEmpty>());
    final states = <LoginState>[];
    controller.list((state) => states.add(state));
    when(service.googleSignIn).thenThrow("Deu error");
    await controller.googleSignIn();
    expect(states[0], isInstanceOf<LoginStateLoading>());
    expect(states[1], isInstanceOf<LoginStateFailure>());
    expect((states[1] as LoginStateFailure).message, "Deu error");
    expect(states.length, 2);
  });

  test("Testando o metodo listen", () async {
    controller.state = LoginStateLoading();
    controller
        .list((state) => expect(state, isInstanceOf<LoginStateLoading>()));
    controller.update();
  });

  test("Testando o metodo update", () async {
    controller.state = LoginStateLoading();
    controller
        .list((state) => expect(state, isInstanceOf<LoginStateLoading>()));
    controller.update();
  });
}
