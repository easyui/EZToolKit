//
//  UIView+EZ_Helper.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import "UIView+EZ_Helper.h"

@implementation UIView (EZ_Helper)
- (UIImage *)ez_snapshotImage
{
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


- (UIImage *)ez_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates
{
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        return [self ez_snapshotImage];
    } else {
        
        UIImage *snapshotImage;
        UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
        {
            [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:afterUpdates];
            snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        }
        UIGraphicsEndImageContext();
        
        return snapshotImage;
    }
}
@end
