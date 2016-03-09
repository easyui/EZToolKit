//
//  UIViewController+EZ_Helper.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (EZ_Helper)

/*!
 @method ez_topMostController
 
 @return Returns the current Top Most ViewController in hierarchy.
 */
- (UIViewController*) ez_topMostController;

/*!
 @method ez_currentViewController
 
 @return Returns the topViewController in stack of topMostController.
 */
- (UIViewController*)ez_currentViewController;


- (UIViewController *)ez_currentViewControllerFromcurrentView;

- (void)ez_displayController:(UIViewController *)controller frame:(CGRect)frame;
- (void)ez_hideController:(UIViewController *)controller;

- (BOOL)ez_isVisible;

- (CGFloat)ez_statusBarHeight;
- (CGFloat)ez_navigationBarHeight;


@end
