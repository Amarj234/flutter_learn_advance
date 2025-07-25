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


class Box2<T, S> {
  late T firstValue;
  late S secondValue;

  Box2(this.firstValue, this.secondValue);

  void show() {
    print('First Value: $firstValue');
    print('Second Value: $secondValue');
  }
}


void main() {
  var intBox = Box<int>(10);
  intBox.show(); // Value: 10

  var stringBox = Box<String>('Hello');
  stringBox.show(); // Value: Hello

  print(getFirst<int>([1, 2, 3])); // 1
  print(getFirst<String>(['a', 'b'])); // a


  var box = Box2<int, String>(10, "Hello");
  box.show();


    var test=Genetic.test( 10);
  print(test.val);//print 10

}


class Genetic<T>{
  T val;
  Genetic({required this.val});
  
factory Genetic.test(int v) => Genetic <T>(val:v as T ); // create subclass of main class


factory Genetic.pest(int v) {
    // You can decide when to return a special subclass
    if (v > 5) {
      
      return Genetic<T>(val: "String" as T);
    } else if(10<v){
      return  Genetic.test(v);
    }else{
        
      return Genetic<T>(val:v as T);
    }
  }
}
