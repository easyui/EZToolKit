//
//  UIViewController+EZ_Helper.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (EZ_Helper)

+ (UIViewController *)ez_UIViewControllerFromView:(UIView *)view;
+ (UIViewController *)ez_presentedUIViewControllerFromViewController:(UIViewController *)viewController;

- (void)ez_displayController:(UIViewController *)controller frame:(CGRect)frame;
- (void)ez_hideController:(UIViewController *)controller;
@end
