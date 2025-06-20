extension GetPength on Object {
  int get pength {
    Lent len = Lent();
    len.check(this);

    return len.lanth;
  }
}

class Lent {
  int lanth = 0;

  bool check(val, [int index = 0]) {
    try {
      val[index]; // Try accessing the index
      lanth = index + 1;
      return check(val, index + 1); // Recursive call
    } catch (_) {
      return false; // Out of range
    }
  }
}

void main() {
  String name = "Amarjeet";
  List list = ["aka", "bsk"];

  print("Custom length: ${name.pength}"); // 8
  print("Custom length: ${list.pength}"); // 8
  print("dart length: ${name.length}"); // 8
}
