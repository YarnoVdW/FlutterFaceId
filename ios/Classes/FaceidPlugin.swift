import Flutter
import UIKit
import LocalAuthentication

public class FaceidPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "faceid", binaryMessenger: registrar.messenger())
        let instance = FaceidPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "authenticate":
            authenticate(result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    func authenticate(result: @escaping FlutterResult) {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Authenticate to access your data"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                if success {
                    result(true)
                } else { 
                    result(false)
                }
            }
        } else {
            result(false)
        }
        
    }
}


