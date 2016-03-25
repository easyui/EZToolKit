//
//  UIViewController+EZ_Find.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/11/28.
//  Copyright © 2015年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (EZ_Find)
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


+ (UIViewController *)ez_currentViewControllerFromcurrentView;


- (BOOL)ez_isVisible;
@end
