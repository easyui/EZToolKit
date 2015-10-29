//
//  UIColor+EZ_Helper.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import "UIColor+EZ_Helper.h"

@implementation UIColor (EZ_Helper)

+ (UIColor *)ez_randomColor {
    return [UIColor colorWithRed:arc4random()%255/255.0
                           green:arc4random()%255/255.0
                            blue:arc4random()%255/255.0
                           alpha:1.0f];
}

//ez_UIColorWithRGBHex:0x0298cf
+ (UIColor *)ez_UIColorWithRGBHex:(UInt32)hex {
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}


+ (UIColor *)ez_UIColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue{
    return [UIColor colorWithRed:red/255. green:green/255. blue:blue/255. alpha:1.];
}

+ (UIColor *)ez_UIColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:red/255. green:green/255. blue:blue/255. alpha:alpha];
}
@end
