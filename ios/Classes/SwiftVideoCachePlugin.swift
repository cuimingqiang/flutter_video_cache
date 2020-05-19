import Flutter
import UIKit

public class SwiftVideoCachePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "videoCache", binaryMessenger: registrar.messenger())
    let instance = SwiftVideoCachePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method == "cacheUrl"){
        let args = call.arguments as? Dictionary<String,String>
        let cache = cacheUrl(url: args!["url"] ?? "")
        result(cache)
    }else{
        result("iOS " + UIDevice.current.systemVersion)
    }
  }

    public func cacheUrl(url:String)->String{
      
        return "我是缓存URL"
    }
}
