#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RNBiometricsDetection, NSObject)

RCT_EXTERN_METHOD(
    hasFingerPrintChanged: (RCTPromiseResolveBlock) resolve
    rejecter: (RCTPromiseRejectBlock) reject
  )
+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
