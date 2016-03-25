//
//  EZAppInfos.h
//  EZToolKit
//
//  Created by yangjun zhu on 16/1/17.
//  Copyright © 2016年 Cactus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIDevice+EZ_Helper.h"

@interface EZAppInfos : NSObject

+ (instancetype)sharedInfo;

@property (strong, readonly, nonatomic) NSString *targetedVersion;
@property (strong, readonly, nonatomic) NSString *currentOSVersion;
@property (strong, readonly, nonatomic) NSString *appVersion;
@property (strong, readonly, nonatomic) NSString *buildRevision;
@property (strong, readonly, nonatomic) NSString *carrierName;
@property (strong, readonly, nonatomic) NSString *identifier;
@property (strong, readonly, nonatomic) NSString *deviceModelName;
@property (assign, readonly, nonatomic) UIDeviceModelType deviceModelType;
@property (assign, readonly, nonatomic) NSInteger batteryLevel; //in pourcent
@property (strong, readonly, nonatomic) NSString *compilationArchitecture;
@end
