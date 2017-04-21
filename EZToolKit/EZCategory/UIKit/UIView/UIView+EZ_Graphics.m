//
//  UIView+EZ_Graphics.m
//  EZToolKit
//
//  Created by IQIYI on 2017/4/6.
//  Copyright © 2017年 Cactus. All rights reserved.
//

#import "UIView+EZ_Graphics.h"

@implementation UIView (EZ_Graphics)
- (void)ez_drawDashWithLineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor isHorizontal:(BOOL)isHorizontal{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:self.bounds];
    CGPoint point = isHorizontal ? CGPointMake(CGRectGetWidth(self.frame)/2 , CGRectGetHeight(self.frame)) : CGPointMake(CGRectGetWidth(self.frame) , CGRectGetHeight(self.frame)/2);
    [shapeLayer setPosition:point];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:isHorizontal ? CGRectGetHeight(self.frame) : CGRectGetWidth(self.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL,0, isHorizontal ?CGRectGetWidth(self.frame) :CGRectGetHeight(self.frame));
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [self.layer addSublayer:shapeLayer];

}
@end
