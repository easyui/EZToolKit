//
//  UIImage+EZ_Helper.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/21.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import "UIImage+EZ_Helper.h"

@implementation UIImage (EZ_Helper)
+ (UIImage *)ez_imageWithColor:(UIColor *)color
{
    CGSize imageSize = CGSizeMake(1, 1);
    UIGraphicsBeginImageContextWithOptions(imageSize, YES, 0);
    [color set];
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, imageSize.width, imageSize.height)];
    [path fill];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext();
    return image;
}
@end
