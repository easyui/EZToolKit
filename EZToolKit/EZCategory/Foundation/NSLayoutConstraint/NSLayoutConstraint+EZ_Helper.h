//
//  NSLayoutConstraint+EZ_Helper.h
//  EZToolKit
//
//  Created by yangjun zhu on 2017/3/29.
//  Copyright © 2017年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSLayoutConstraint (EZ_Helper)
@property (nonatomic, readonly) UIView *ez_firstView;
@property (nullable, nonatomic, readonly) UIView *ez_secondView;
@property (nonatomic, readonly) BOOL ez_isUnary;//单约束
@property (nonatomic, readonly) UIView *ez_nearestCommonAncestor;// 最近的父视图


- (BOOL) ez_install;
- (BOOL) ez_install: (float) priority;
- (BOOL) ez_remove;
@end
NS_ASSUME_NONNULL_END
