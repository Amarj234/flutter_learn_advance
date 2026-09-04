abstract class UserDataSource {
  void getUsers();
}

class ApiService implements UserDataSource {
  @override
  void getUsers() {
    print("Get users from API");
  }
}

class UserRepository {
  final UserDataSource dataSource;

  UserRepository(this.dataSource);

  void getUsers() {
    dataSource.getUsers();
  }
}
// अब आसानी से Mock भी दे सकते हैं:
class MockUserDataSource implements UserDataSource {
  @override
  void getUsers() {
    print("Mock users");
  }
}