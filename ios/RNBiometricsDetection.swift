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
          if let domainState = context.evaluatedPolicyDomainState {
              let bData = domainState.base64EncodedData()
              if let decodedString = String(data: bData, encoding: .utf8) {
                  // Retrieve the previously stored data from Keychain
                  if let storedData = KeychainHelper.load(key: "fingerprintID"),
                     let storedString = String(data: storedData, encoding: .utf8) {
                      KeychainHelper.save(key: "fingerprintID", data: bData)
                      // Compare the decoded string with the stored data
                      if decodedString == storedString {
                          resolve(false)
                      } else {
                          resolve(true)
                      }
                  } else {
                      KeychainHelper.save(key: "fingerprintID", data: bData)
                      resolve(false)
                  }
              }
          }
      }
    else {
        reject("0", "Cannot evaulate", nil)
    }
  }
}
