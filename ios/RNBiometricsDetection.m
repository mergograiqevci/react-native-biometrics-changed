// RNBiometricsDetection.m
#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RNBiometricsDetection, NSObject)

RCT_EXTERN_METHOD(
  getFingerprintInfo: (RCTPromiseResolveBlock)resolve
  rejecter: (RCTPromiseRejectBlock)reject
)

@end
