//
//  UIWindow+EZ_helper.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/6/10.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (EZ_helper)
/*!
 @method topMostController
 
 @return Returns the current Top Most ViewController in hierarchy.
 */
- (UIViewController*) ez_topMostController;

/*!
 @method currentViewController
 
 @return Returns the topViewController in stack of topMostController.
 */
- (UIViewController*)ez_currentViewController;
@end
