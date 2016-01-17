//
//  EZAppInfos.m
//  EZToolKit
//
//  Created by yangjun zhu on 16/1/17.
//  Copyright © 2016年 Cactus. All rights reserved.
//

#import "EZAppInfos.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
@implementation EZAppInfos

+ (instancetype)sharedInfo
{
    static EZAppInfos *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

#pragma overrided - getters

- (NSString *)targetedVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleInfoDictionaryVersion"];
}

- (NSString *)currentOSVersion
{
    return [UIDevice currentDevice].systemVersion;
}

- (NSString *)appVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

- (NSString *)buildRevision
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

//carrier
- (NSString *)carrierName
{
    CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [netinfo subscriberCellularProvider];
    return [carrier carrierName];
}

- (NSString *)deviceModelName
{
    return [UIDevice ez_modelName];
}

- (UIDeviceModelType)deviceModelType
{
    return [UIDevice ez_deviceModelType];
}



- (NSString *)compilationArchitecture
{
#if __LP64__
    return @"64bits";
#else
    return @"32bits";
#endif
}



- (NSInteger)batteryLevel
{
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    return (NSInteger)([UIDevice currentDevice].batteryLevel * 100.0f);
}


@end
