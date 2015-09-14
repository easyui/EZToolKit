//
//  UIScreen+EZ_Rect.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/8/27.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import "UIScreen+EZ_Rect.h"

@implementation UIScreen (EZ_Rect)


+ (CGFloat)ez_mainScreenLongSide
{
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    return screenSize.width > screenSize.height ? screenSize.width : screenSize.height;
}

+ (CGFloat)ez_mainScreenShortSide
{
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    return screenSize.width > screenSize.height ? screenSize.height : screenSize.width;
}
@end
