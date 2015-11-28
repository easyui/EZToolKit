//
//  UIWindow+EZ_helper.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/6/10.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import "UIWindow+EZ_helper.h"

@implementation UIWindow (EZ_helper)
- (UIViewController*) ez_topMostController
{
    UIViewController *topController = [self rootViewController];
    
    //  Getting topMost ViewController
    while ([topController presentedViewController])	topController = [topController presentedViewController];
    
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
@end
