//
//  RNBiometricsDetection.m
//  bezahlkarte
//
//  Created by Mergim Graiqevci on 12.8.24.
//

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"
@interface RCT_EXTERN_MODULE(RNBiometricsDetection, NSObject)
  RCT_EXTERN_METHOD(
    getFingerprintInfo: (RCTPromiseResolveBlock) resolve
    rejecter: (RCTPromiseRejectBlock) reject
  )
@end