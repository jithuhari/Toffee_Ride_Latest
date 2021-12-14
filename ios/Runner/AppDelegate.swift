import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: "toffee_ride.flutter.dev/orientation",
                                              binaryMessenger: controller.binaryMessenger)
    
    batteryChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
      // Note: this method is invoked on the UI thread.
//        guard call.method == "setLOrientation" || call.method == "setPOrientation" else {
//            result(FlutterMethodNotImplemented)
//            return
//        }
//        
//        self?.setOrientation(type: call.method)
    })
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func setOrientation(type: String) {
        //DispatchQueue.main.async {
            if type == "setLOrientation" {
                UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft, forKey: "orientation");
            } else if type == "setPOrientation" {
                UIDevice.current.setValue(UIInterfaceOrientation.portraitUpsideDown, forKey: "orientation");
            }
        //}
    }
}
