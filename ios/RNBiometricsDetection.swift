import Foundation
import LocalAuthentication
@objc(RNBiometricsDetection) class RNBiometricsDetection: NSObject {
  @objc static func requiresMainQueueSetup() -> Bool { return true }
  @objc public func hasFingerPrintChanged(
    _ resolve: RCTPromiseResolveBlock,
    rejecter reject: RCTPromiseRejectBlock
  ) -> Void {
    let context = LAContext()
    
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
        // Retrieve the previously stored data from Keychain
        if let storedData = KeychainHelper.load(key: "fingerprintID"),
          let storedString = String(data: storedData, encoding: .utf8) {
          KeychainHelper.save(key: "fingerprintID", data: bData)
          // Compare the decoded string with the stored data
          if decodedString == storedString {
              print("Fingerprint ID matches.")
              resolve(false)
          } else {
              print("Fingerprint ID does not match.")
              resolve(true)
          }
        } else {
            KeychainHelper.save(key: "fingerprintID", data: bData)
            resolve(false)
        }
    }
    else {
        print("Cannot evaulate")
        reject("0", "Cannot evaulate", nil)
    }
  }
}
