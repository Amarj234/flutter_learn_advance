import UIKit
import FLutter


@UIApplicationMain

@obj class AppDelegate :FluterAppDelegate{

private let CHANNEL ="simpleflutter.battery"

override func appication(_application:UIApplication,didFinishLaunchingWithOption launchOption:[UIApplication.LaunchOptionsKey:Any]?)->Bool{
let controller window?.rootViewController as! FlutterViewController as! FlutterViewController
let battryChannel= FlutterMethodChannel(name
:CHANNEL,binaryMessege:controller.binaryMassenger)

battryChannel.setMethodCallHandler({
    (call:FluuterMethodCall,result:@escaping FlutterResult)-> Void in
if call.method=="getBatteryLevel"{
    //     guard let args = call.arguments as? [String: Any],
    //     let ssid = args["ssid"] as? String, // if you pass any perameter from flutter side you can get here

    self.receiveBatteryLevel(result:result)
}else{
    result(FlutterMethodNotImplemented)
}
})
return super.appication(application,didFinishLaunchingWithOption:launchOption)

}

private func receiveBatteryLevel(result:FlutterResult){
    let device UIDevice.current
    device.isBatteryMonitringEnabled=true
    if device.batteryState==.unknown{
        result(FlutterError(code:"UNAVAiliable",message:"battery not found",details:nil))
    }else{
        result(Int(device.batteryLevel*100))
    }
}

}

