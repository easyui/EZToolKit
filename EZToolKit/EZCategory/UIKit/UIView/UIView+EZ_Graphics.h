//
//  UIView+EZ_Graphics.h
//  EZToolKit
//
//  Created by IQIYI on 2017/4/6.
//  Copyright © 2017年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (EZ_Graphics)
- (void)ez_drawDashWithLineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor isHorizontal:(BOOL)isHorizontal;
@end
