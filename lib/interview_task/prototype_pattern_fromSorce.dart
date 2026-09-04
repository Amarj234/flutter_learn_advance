abstract class GraphicsElement {
  int x;
  int y;
  String color;

  GraphicsElement({required this.y,required this.color,required this.x});
  void render();
  GraphicsElement clone();
}

class UIElement extends GraphicsElement{
  final String lable;
  final List<String> permissions;

  UIElement({required super.color,required super.x,required super.y,required this.permissions,required this.lable});

  UIElement.fromSource(UIElement source):
        lable=source.lable,
        permissions = List<String>.from(source.permissions),
      super(x:source.x,y:source.y,color:source.color);

  @override
  GraphicsElement clone() {
    return UIElement.fromSource(this);
  }

  @override
  void render() {
    print("🎨 Rendered '$lable' at [$x, $y] with color '$color'. Roles: $permissions");
  }
}

main(){

  UIElement uiElement =UIElement(color: "red", x: 10, y: 20, permissions: ["storage,camera"], lable: "Computer");
  uiElement.render();
  UIElement uiElement2=uiElement.clone() as UIElement;

  uiElement2.x=100;
  uiElement2.y=200;
  uiElement2.color="green";

  uiElement2.render();

}