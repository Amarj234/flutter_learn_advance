import 'dart:async';

import 'package:flutter/material.dart';


void main(){

  runApp(MaterialApp(home: MyWidget()));
}




class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

StreamController<int> myController =StreamController<int>.broadcast();
int count =0;




Stream<int> myFun(Duration due) async* {
  // Start the internal delayed stream
  for (int i = 0; i < 100; i++) {
    await Future.delayed(due);
    yield i;
  }


}

Future<int> dataGet()async{
  await Future.delayed(Duration(seconds: 5));
  return 500;
}


increment(){
count++;
myController.sink.add(count);

}
@override
  void initState() {
    // TODO: implement initState
    super.initState();

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future:  dataGet(),
            initialData: 100,
            builder: (context, snapshot) => Text(snapshot.data.toString())
        ),
      ),
    ),
    );
  }
}