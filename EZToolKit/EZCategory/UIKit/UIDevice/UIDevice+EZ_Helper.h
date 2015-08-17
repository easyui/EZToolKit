//
//  UIDevice+EZ_Helper.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (EZ_Helper)
- (NSString *)ez_networkStatus;
- (NSString *)ez_serialNumber;
+ (double)ez_vailableMemory;
@end
