


import 'package:flutter/services.dart';

class MethodCall {

static const platform =MethodChannel('simpleflutter.battery');
getBattery()async{

  try{

    final int result =await platform.invokeMethod("getBatteryLevel");
print(result);

  }catch(e){

    print("$e");
  }


}

}
