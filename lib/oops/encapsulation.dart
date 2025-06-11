


class Account {
  double _balance = 0; // private variable

  double get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
    }
  }

  void withdraw(double amount) {
    if (amount <= _balance) {
      _balance -= amount;
    }
  }
}

class User {
  final String _username;
  String _password;
  bool _loggedIn = false;

  User(this._username, this._password);

  // Getter to check login status
  bool get isLoggedIn => _loggedIn;

  // Method to login
  bool login(String username, String password) {
    if (_username == username && _password == password) {
      _loggedIn = true;
      return true;
    }
    return false;
  }

  // Change password (only when logged in)
  bool changePassword(String oldPass, String newPass) {
    if (_loggedIn && oldPass == _password) {
      _password = newPass;
      return true;
    }
    return false;
  }

  // Logout
  void logout() {
    _loggedIn = false;
  }
}




void main() {
  final acc = Account();

  acc.deposit(1000);
  print(acc.balance); // ✅ 1000

  acc.withdraw(500);
  print(acc.balance); // ✅ 500

  acc.withdraw(1000); // ❌ Won’t go below zero
  print(acc.balance); // ✅ Still 500





  var user = User("amar", "12345");

  print(user.isLoggedIn); // false

  var success = user.login("amar", "12345");
  print("Login successful: $success"); // true
  print(user.isLoggedIn); // true

  user.changePassword("12345", "67890");

  user.logout();
  print(user.isLoggedIn); // false
}
