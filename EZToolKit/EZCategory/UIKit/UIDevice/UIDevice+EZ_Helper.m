//
//  UIDevice+EZ_Helper.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import "UIDevice+EZ_Helper.h"
#import <dlfcn.h>
#import <mach/port.h>
#import <mach/kern_return.h>
#import <mach/mach.h>
#import <mach/mach_host.h>
#import <netinet/in.h>
#import <SystemConfiguration/SCNetworkReachability.h>

#include <sys/sysctl.h>


NSString * const UIDeviceModeliPhone1G                      = @"iPhone 1G";
NSString * const UIDeviceModeliPhone3G                      = @"iPhone 3G";
NSString * const UIDeviceModeliPhone3GS                     = @"iPhone 3GS";

NSString * const UIDeviceModeliPhone4                       = @"iPhone 4";
NSString * const UIDeviceModelVerizoniPhone4                = @"Verizon iPhone 4";
NSString * const UIDeviceModeliPhone4S                      = @"iPhone 4S";

NSString * const UIDeviceModeliPhone5_GSM                   = @"iPhone 5 (GSM)";
NSString * const UIDeviceModeliPhone5_GSM_CDMA              = @"iPhone 5 (GSM+CDMA)";
NSString * const UIDeviceModeliPhone5C_GSM                  = @"iPhone 5C (GSM)";
NSString * const UIDeviceModeliPhone5C_Global               = @"iPhone 5C (Global)";

NSString * const UIDeviceModeliPhone5S_GSM                  = @"iPhone 5S (GSM)";
NSString * const UIDeviceModeliPhone5S_Global               = @"iPhone 5S (Global)";

NSString * const UIDeviceModeliPhone6                       = @"iPhone 6";
NSString * const UIDeviceModeliPhone6Plus                   = @"iPhone 6 Plus";

NSString * const UIDeviceModeliPodTouch1G                   = @"iPod Touch 1G";
NSString * const UIDeviceModeliPodTouch2G                   = @"iPod Touch 2G";
NSString * const UIDeviceModeliPodTouch3G                   = @"iPod Touch 3G";
NSString * const UIDeviceModeliPodTouch4G                   = @"iPod Touch 4G";
NSString * const UIDeviceModeliPodTouch5G                   = @"iPod Touch 5G";

NSString * const UIDeviceModeliPad                          = @"iPad";
NSString * const UIDeviceModeliPad2_Wifi                    = @"iPad 2 (WiFi)";
NSString * const UIDeviceModeliPad2_GSM                     = @"iPad 2 (GSM)";
NSString * const UIDeviceModeliPad2_CDMA                    = @"iPad 2 (CDMA)";
NSString * const UIDeviceModeliPad2                         = @"iPad 2";
NSString * const UIDeviceModeliPad3G_Wifi                   = @"iPad-3G (WiFi)";
NSString * const UIDeviceModeliPad3G_4G                     = @"iPad-3G (4G)";
NSString * const UIDeviceModeliPad4G_Wifi                   = @"iPad-4G (WiFi)";
NSString * const UIDeviceModeliPad4G_GSM                    = @"iPad-4G (GSM)";
NSString * const UIDeviceModeliPad4G_GSM_CDMA               = @"iPad-4G (GSM+CDMA)";

NSString * const UIDeviceModeliPadMini1G_Wifi               = @"iPad mini-1G (WiFi)";
NSString * const UIDeviceModeliPadMini1G_GSM                = @"iPad mini-1G (GSM)";
NSString * const UIDeviceModeliPadMini1G_GSM_CDMA           = @"iPad mini-1G (GSM+CDMA)";
NSString * const UIDeviceModeliPadMiniRetina2G_Wifi         = @"iPad mini 2G Retina (WiFi)";
NSString * const UIDeviceModeliPadMiniRetina2G_Cellular     = @"iPad mini 2G Retina (Cellular)";
NSString * const UIDeviceModeliPadAir_Wifi                  = @"iPad Air (WiFi)";
NSString * const UIDeviceModeliPadAir_Cellular              = @"iPad Air (Cellular)";
NSString * const UIDeviceModeliPadAir_4GCellular            = @"iPad Air (4G)";
NSString * const UIDeviceModeliPadMiniRetina4G_Cellular     = @"iPad mini (4G)";

NSString * const UIDeviceModeliPadAir2_Wifi                 = @"iPad Air 2 (WiFi)";
NSString * const UIDeviceModeliPadAir2_Cellular             = @"iPad Air 2 (Cellular)";
NSString * const UIDeviceModeliPadMiniRetina3_Wifi          = @"iPad mini 3 Retina (Wifi)";
NSString * const UIDeviceModeliPadMiniRetina3_Cellular      = @"iPad mini 3 Retina (Cellular)";

NSString * const UIDeviceModelSimulatorI386                 = @"iPhone Simulator (i386)";
NSString * const UIDeviceModelSimulatorX86_64               = @"iPhone Simulator (x86_64)";
NSString * const UIDeviceModelSimulator                     = @"iPhone Simulator";


@implementation UIDevice (EZ_Helper)
- (NSString *)ez_networkStatus{
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    zeroAddress.sin_addr.s_addr = 0xA9FE0000;
    
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    NSString *tempString=nil;
    if (flags & kSCNetworkReachabilityFlagsReachable) {
        tempString = @"WiFi";
    }
    if (flags & kSCNetworkReachabilityFlagsIsWWAN) {
        tempString = @"Carrier";
    }
    return tempString;
}

- (NSString *)ez_serialNumber{
    NSString *serialNumber = nil;
    
    void *IOKit = dlopen("/System/Library/Frameworks/IOKit.framework/IOKit", RTLD_NOW);
    if (IOKit)
    {
        mach_port_t *kIOMasterPortDefault = dlsym(IOKit, "kIOMasterPortDefault");
        CFMutableDictionaryRef (*IOServiceMatching)(const char *name) = dlsym(IOKit, "IOServiceMatching");
        mach_port_t (*IOServiceGetMatchingService)(mach_port_t masterPort, CFDictionaryRef matching) = dlsym(IOKit, "IOServiceGetMatchingService");
        CFTypeRef (*IORegistryEntryCreateCFProperty)(mach_port_t entry, CFStringRef key, CFAllocatorRef allocator, uint32_t options) = dlsym(IOKit, "IORegistryEntryCreateCFProperty");
        kern_return_t (*IOObjectRelease)(mach_port_t object) = dlsym(IOKit, "IOObjectRelease");
        
        if (kIOMasterPortDefault && IOServiceGetMatchingService && IORegistryEntryCreateCFProperty && IOObjectRelease)
        {
            mach_port_t platformExpertDevice = IOServiceGetMatchingService(*kIOMasterPortDefault, IOServiceMatching("IOPlatformExpertDevice"));
            if (platformExpertDevice)
            {
                CFTypeRef platformSerialNumber = IORegistryEntryCreateCFProperty(platformExpertDevice, CFSTR("IOPlatformSerialNumber"), kCFAllocatorDefault, 0);
                if (CFGetTypeID(platformSerialNumber) == CFStringGetTypeID())
                {
                    serialNumber = [NSString stringWithString:(__bridge NSString*)platformSerialNumber];
                    CFRelease(platformSerialNumber);
                }
                IOObjectRelease(platformExpertDevice);
            }
        }
        dlclose(IOKit);
    }
    
    return serialNumber;
}

+ (double)ez_vailableMemory{
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    
    if (kernReturn != KERN_SUCCESS)
    {
        return NSNotFound;
    }
    
    return (vm_page_size * vmStats.free_count);
}



+ (NSString *) ez_getSysInfo
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    
    char *answer = malloc(size);
    sysctlbyname("hw.machine", answer, &size, NULL, 0);
    
    NSString *results = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];
    
    free(answer);
    return results;
}

+ (NSString *)ez_modelName
{
    NSString *systInfo = [self ez_getSysInfo];
    if ([systInfo isEqualToString:@"iPhone1,1"])    return UIDeviceModeliPhone1G;
    if ([systInfo isEqualToString:@"iPhone1,2"])    return UIDeviceModeliPhone3G;
    if ([systInfo isEqualToString:@"iPhone2,1"])    return UIDeviceModeliPhone3GS;
    if ([systInfo isEqualToString:@"iPhone3,1"])    return UIDeviceModeliPhone4;
    if ([systInfo isEqualToString:@"iPhone3,2"])    return UIDeviceModeliPhone4;
    if ([systInfo isEqualToString:@"iPhone3,3"])    return UIDeviceModelVerizoniPhone4;
    if ([systInfo isEqualToString:@"iPhone4,1"])    return UIDeviceModeliPhone4S;
    if ([systInfo isEqualToString:@"iPhone5,1"])    return UIDeviceModeliPhone5_GSM;
    if ([systInfo isEqualToString:@"iPhone5,2"])    return UIDeviceModeliPhone5_GSM_CDMA;
    if ([systInfo isEqualToString:@"iPhone5,3"])    return UIDeviceModeliPhone5C_GSM;
    if ([systInfo isEqualToString:@"iPhone5,4"])    return UIDeviceModeliPhone5C_Global;
    if ([systInfo isEqualToString:@"iPhone6,1"])    return UIDeviceModeliPhone5S_GSM;
    if ([systInfo isEqualToString:@"iPhone6,2"])    return UIDeviceModeliPhone5S_Global;
    if ([systInfo isEqualToString:@"iPhone7,1"])    return UIDeviceModeliPhone6Plus;
    if ([systInfo isEqualToString:@"iPhone7,2"])    return UIDeviceModeliPhone6;
    
    if ([systInfo isEqualToString:@"iPod1,1"])      return UIDeviceModeliPodTouch1G;
    if ([systInfo isEqualToString:@"iPod2,1"])      return UIDeviceModeliPodTouch2G;
    if ([systInfo isEqualToString:@"iPod3,1"])      return UIDeviceModeliPodTouch3G;
    if ([systInfo isEqualToString:@"iPod4,1"])      return UIDeviceModeliPodTouch4G;
    if ([systInfo isEqualToString:@"iPod5,1"])      return UIDeviceModeliPodTouch5G;
    
    if ([systInfo isEqualToString:@"iPad1,1"])      return UIDeviceModeliPad;
    if ([systInfo isEqualToString:@"iPad2,1"])      return UIDeviceModeliPad2_Wifi;
    if ([systInfo isEqualToString:@"iPad2,2"])      return UIDeviceModeliPad2_GSM;
    if ([systInfo isEqualToString:@"iPad2,3"])      return UIDeviceModeliPad2_CDMA;
    if ([systInfo isEqualToString:@"iPad2,4"])      return UIDeviceModeliPad2;
    if ([systInfo isEqualToString:@"iPad2,5"])      return UIDeviceModeliPadMini1G_Wifi;
    if ([systInfo isEqualToString:@"iPad2,6"])      return UIDeviceModeliPadMini1G_GSM;
    if ([systInfo isEqualToString:@"iPad2,7"])      return UIDeviceModeliPadMini1G_GSM_CDMA;
    if ([systInfo isEqualToString:@"iPad3,1"])      return UIDeviceModeliPad3G_Wifi;
    if ([systInfo isEqualToString:@"iPad3,2"])      return UIDeviceModeliPad3G_4G;
    if ([systInfo isEqualToString:@"iPad3,3"])      return UIDeviceModeliPad3G_4G;
    if ([systInfo isEqualToString:@"iPad3,4"])      return UIDeviceModeliPad4G_Wifi;
    if ([systInfo isEqualToString:@"iPad3,5"])      return UIDeviceModeliPad4G_GSM;
    if ([systInfo isEqualToString:@"iPad3,6"])      return UIDeviceModeliPad4G_GSM_CDMA;
    if ([systInfo isEqualToString:@"iPad4,1"])      return UIDeviceModeliPadAir_Wifi;
    if ([systInfo isEqualToString:@"iPad4,2"])      return UIDeviceModeliPadAir_Cellular;
    if ([systInfo isEqualToString:@"iPad4,3"])      return UIDeviceModeliPadAir_4GCellular;
    if ([systInfo isEqualToString:@"iPad4,4"])      return UIDeviceModeliPadMiniRetina2G_Wifi;
    if ([systInfo isEqualToString:@"iPad4,5"])      return UIDeviceModeliPadMiniRetina2G_Cellular;
    if ([systInfo isEqualToString:@"iPad4,6"])      return UIDeviceModeliPadMiniRetina4G_Cellular;
    
    if ([systInfo isEqualToString:@"iPad4,7"])      return UIDeviceModeliPadMiniRetina3_Wifi;
    if ([systInfo isEqualToString:@"iPad4,8"])      return UIDeviceModeliPadMiniRetina3_Cellular;
    if ([systInfo isEqualToString:@"iPad4,9"])      return UIDeviceModeliPadMiniRetina3_Cellular;
    if ([systInfo isEqualToString:@"iPad5,3"])      return UIDeviceModeliPadAir2_Wifi;
    if ([systInfo isEqualToString:@"iPad5,4"])      return UIDeviceModeliPadAir2_Cellular;
    
    if ([systInfo isEqualToString:@"i386"])         return UIDeviceModelSimulator;
    if ([systInfo isEqualToString:@"x86_64"])       return UIDeviceModelSimulator;
    
    return systInfo;
}

+ (UIDeviceModelType)ez_deviceModelType {
    NSString *modelName = [self ez_modelName];
    
    if ([modelName isEqualToString:UIDeviceModelSimulator]) {
        return UIDeviceModelTypeSimulator;
    }
    else if ([modelName rangeOfString:@"iPhone"].location != NSNotFound) {
        return UIDeviceModelTypeiPhone;
    }
    else if ([modelName rangeOfString:@"iPod"].location != NSNotFound) {
        return UIDeviceModelTypeiPod;
    }
    else if ([modelName rangeOfString:@"iPad"].location != NSNotFound) {
        return UIDeviceModelTypeiPad;
    }
    
    return UIDeviceModelTypeSimulator;
}

@end
