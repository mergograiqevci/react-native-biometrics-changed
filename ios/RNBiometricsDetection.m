#import "RNBiometricsDetection.h"
#import <React/RCTLog.h>

@implementation RNBiometricsDetection

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(myNativeMethod:(NSString *)param resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
  RCTLogInfo(@"Received param: %@", param);
  // Your native code logic here
  resolve(@(YES));
}

@end
