//
//  UIImage+EZ_Helper.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/21.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (EZ_Helper)
+ (UIImage *)ez_imageWithColor:(UIColor *)color;
+ (UIImage *)ez_createImageWithWithFrame:(CGSize)size Path:(UIBezierPath *)path color:(UIColor*)stokeColor backColor:(UIColor*)backColor lineWidth:(CGFloat)lineW;
@end
