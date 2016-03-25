//
//  UIColor+EZ_Helper.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (EZ_Helper)

+ (UIColor *)ez_randomColor;

//ez_UIColorWithRGBHex:0x0298cf
+ (UIColor *)ez_UIColorWithRGBHex:(UInt32)hex;

+ (UIColor *)ez_UIColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

+ (UIColor *)ez_UIColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
@end
