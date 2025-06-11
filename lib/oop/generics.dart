class Box<T> {
  T value;
  Box(this.value);

  void show() {
    print('Value: $value');
  }
}

T getFirst<T>(List<T> items) {
  return items.first;
}

void main() {
  var intBox = Box<int>(10);
  intBox.show(); // Value: 10

  var stringBox = Box<String>('Hello');
  stringBox.show(); // Value: Hello

  print(getFirst<int>([1, 2, 3])); // 1
  print(getFirst<String>(['a', 'b'])); // a
}
