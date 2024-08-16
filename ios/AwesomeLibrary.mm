#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(AwesomeLibrary, NSObject)

RCT_EXTERN_METHOD(
    getFingerprintInfo: (RCTPromiseResolveBlock) resolve
    rejecter: (RCTPromiseRejectBlock) reject
  )
+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
