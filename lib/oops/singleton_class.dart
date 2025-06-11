

class SingletonClass {
  // Private constructor
  SingletonClass._privateConstructor();

  // Static instance of the class
  static final SingletonClass _instance = SingletonClass._privateConstructor();

  // Factory constructor to return the same instance
  factory SingletonClass() {
    return _instance;
  }

  // Example method
  void exampleMethod() {
    print('This is an example method in the singleton class.');
  }
}


void main() {
  // Access the singleton instance
  SingletonClass singleton1 = SingletonClass();
  SingletonClass singleton2 = SingletonClass();

  SingletonClass singleton3 = SingletonClass._instance; // This will cause an error if uncommented

  // Both instances should be the same
  print(identical(singleton1, singleton2)); // true

  // Call a method on the singleton instance
  singleton1.exampleMethod(); // This is an example method in the singleton class.
}