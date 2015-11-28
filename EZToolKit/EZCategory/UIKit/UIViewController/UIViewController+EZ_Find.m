//
//  UIViewController+EZ_Find.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/11/28.
//  Copyright © 2015年 Cactus. All rights reserved.
//

#import "UIViewController+EZ_Find.h"

@implementation UIViewController (EZ_Find)

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


+ (UIViewController *)ez_currentViewControllerFromcurrentView{
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



- (BOOL)ez_isVisible {
    return [self isViewLoaded] && self.view.window;
}
@end
