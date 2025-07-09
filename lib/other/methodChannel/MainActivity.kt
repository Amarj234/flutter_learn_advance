
package com.example.learn_more

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import android.os.Build
import android.content.Context
import io.flutter.plugin.common.MethodChannel
import android.os.BatteryManager

class MainActivity:FlutterActivity(){

    private val CHANNEL="simpleflutter.battery"


    override fin configureFlutterEngine(flutterEngine:FlutterEngine){
        super.configureFlutterEngine(flutterEngine)

MethodChannel(flutterEngine.dartExecutor.binaryMessenger,CHANNEL).setMethodCallHandler{
    call,result->

    if(call.method=="getBatteryLevel"){
        val batteryLevel=getBatteryLavel()

        if(batteryLavel !=-1){

            result.success(batteryLavel);
        }else{
            result.error("unavalable","battery not founds",null)
        }
    }else{
        result.notImplemented()
    }
}



    }


private fun getBatteryLavel():Int{
    val batterManager=getSystemService(Context.BATTERY_SERVICE) as BatteryManager
    return if(Build.VERSION.SDK_INT>= Build.VERSION_CODES.LOLLIPOP){
        batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    }else{
        -1
    }
}




}



