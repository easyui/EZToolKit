//
//  UILabel+EZ_Rect.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (EZ_Rect)
- (CGFloat)ez_textHeight;
- (CGFloat)ez_textWidth;

- (void)ez_fixHeight;
- (void)ez_fixHeightWithText:(NSString *)text;
- (void)ez_fixHeightWithMaxNumberLine:(NSUInteger)maxNumberLine;
- (void)ez_fixHeighthWithMaxNumberLine:(NSUInteger)maxNumberLine withText:(NSString *)text;
@end
