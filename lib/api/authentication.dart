import 'dart:async';



class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    var token ="use local storage or any other method to get token";
    if (token?.isEmpty == false) {
      yield AuthenticationStatus.authenticated;
    } else {
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _controller.stream;
  }

  Future<void> logIn({required String token}) async {
   // SPManager.instance.setToken(token);
    _controller.add(AuthenticationStatus.authenticated);
  }

  Future<void> logOut() async {
  //  SPManager.instance.logout();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
}
