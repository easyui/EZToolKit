//
//  UIColor+EZ_Helper.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIColor (EZ_Helper)
#pragma mark - Create a UIColor Object
+ (UIColor *)ez_randomColor;

//ez_UIColorWithRGBHex:0x0298cf
+ (UIColor *)ez_UIColorWithRGBHex:(UInt32)hex;
+ (UIColor *)ez_UIColorWithRGBHex:(UInt32)hex alpha:(CGFloat)alpha;


+ (UIColor *)ez_UIColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
+ (UIColor *)ez_UIColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

// @"0xF0F", @"66ccff", @"#66CCFF88"
+ (nullable UIColor *)colorWithHexString:(NSString *)hexStr;

#pragma mark - Get color's description

// 0x66ccff.
- (uint32_t)ez_RGBHexValue;

//0x66ccffff.
- (uint32_t)ez_RGBAHexValue;

//@"0066cc".
- (nullable NSString *)ez_RGBhexString;

// @"0066ccff".
- (nullable NSString *)ez_RGBAhexString;


//0.0 - 1.0
@property (nonatomic, readonly) CGFloat ez_red;

//0.0 - 1.0
@property (nonatomic, readonly) CGFloat ez_green;

//0.0 - 1.0
@property (nonatomic, readonly) CGFloat ez_blue;

//0.0 - 1.0
@property (nonatomic, readonly) CGFloat ez_alpha;

@end
NS_ASSUME_NONNULL_END
