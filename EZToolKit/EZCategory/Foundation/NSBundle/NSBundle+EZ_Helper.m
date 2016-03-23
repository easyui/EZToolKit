//
//  NSBundle+EZ_Helper.m
//  EZToolKit
//
//  Created by yangjun zhu on 16/3/23.
//  Copyright © 2016年 Cactus. All rights reserved.
//

#import "NSBundle+EZ_Helper.h"

@implementation NSBundle (EZ_Helper)

+ (NSBundle *)bundleName:(NSString*)name{
    NSString * bundlePath = [[ NSBundle mainBundle] pathForResource: name ofType :@ "bundle"];
    NSBundle *resourceBundle = [NSBundle bundleWithPath:bundlePath];
    return resourceBundle;
}

@end
