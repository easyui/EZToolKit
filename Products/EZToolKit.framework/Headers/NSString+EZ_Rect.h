//
//  NSString+EZ_Rect.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/7/7.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (EZ_Rect)
- (CGFloat)ez_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
- (CGFloat)ez_widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

- (CGSize)ez_sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
- (CGSize)ez_sizeWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;
@end
