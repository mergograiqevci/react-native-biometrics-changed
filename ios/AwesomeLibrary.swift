import Foundation
import LocalAuthentication
@objc(AwesomeLibrary) class AwesomeLibrary: NSObject {
  @objc static func requiresMainQueueSetup() -> Bool { return true }
  @objc public func getFingerprintInfo(
    _ resolve: RCTPromiseResolveBlock,
    rejecter reject: RCTPromiseRejectBlock
  ) -> Void {
    let context = LAContext()
    
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
        if let domainState = context.evaluatedPolicyDomainState {
            let bData = domainState.base64EncodedData()
            if let decodedString = String(data: bData, encoding: .utf8) {
                print("Decoded Value: \(decodedString)")
                resolve(decodedString)
            }
        }
    }
    else {
        print("Cannot evaulate")
        reject("0", "Cannot evaulate", nil)
    }
  }
}
