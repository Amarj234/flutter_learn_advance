
enum ShapeType{
  circle,
  rectangle,
  triangle
}

abstract class Shape{
  void drow();

  factory Shape(ShapeType type){
    switch(type){
      case ShapeType.rectangle:
        return Rectangle();
      case ShapeType.circle:
        return Circle();
      case ShapeType.triangle:
        return Triangle();
    }
  }
}

class Circle implements Shape{
  @override
  void drow() {
    print("Circle");
  }

}

class Rectangle implements Shape{

  @override
  void drow() {
    print("Rectangle");
  }
}

class Triangle implements Shape{

  @override
  void drow(){
    print("triangle");
  }
}

main() {
  Shape shape= Shape(ShapeType.circle);
  shape.drow();
  shape=Shape(ShapeType.triangle);
  shape.drow();

}