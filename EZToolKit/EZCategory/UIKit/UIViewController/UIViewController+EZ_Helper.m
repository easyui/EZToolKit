//
//  UIViewController+EZ_Helper.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import "UIViewController+EZ_Helper.h"

@implementation UIViewController (EZ_Helper)


- (UIViewController*) ez_topMostController
{
    UIViewController *topController = self ;
    
    //  Getting topMost ViewController
    while ([self presentedViewController])	topController = [topController presentedViewController];
    
    //  Returning topMost ViewController
    return topController;
}

- (UIViewController*)ez_currentViewController;
{
    UIViewController *currentViewController = [self ez_topMostController];
    
    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)currentViewController topViewController])
    currentViewController = [(UINavigationController*)currentViewController topViewController];
    
    return currentViewController;
}


- (UIViewController *)ez_currentViewControllerFromcurrentView{
    UIViewController *result = nil;
    // 1. get current window
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    // 2. get current View Controller
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
    } else {
        result = window.rootViewController;
    }
    return result;
}

- (void)ez_displayController:(UIViewController *)controller frame:(CGRect)frame
{
    [self addChildViewController:controller];
    controller.view.frame = frame;
    [self.view addSubview:controller.view];
    [controller didMoveToParentViewController:self];
}

- (void)ez_hideController:(UIViewController *)controller
{
    [controller willMoveToParentViewController:nil];
    [controller.view removeFromSuperview];
    [controller removeFromParentViewController];
}

- (BOOL)ez_isVisible {
    return [self isViewLoaded] && self.view.window;
}

- (CGFloat)ez_statusBarHeight{
   return  [self.view.window convertRect:[UIApplication sharedApplication].statusBarFrame toView:self.view].size.height;
}

- (CGFloat)ez_navigationBarHeight{
   return  self.navigationController.navigationBar.frame.size.height;
}
@end
