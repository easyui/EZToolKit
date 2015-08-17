//
//  UIViewController+EZ_Helper.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import "UIViewController+EZ_Helper.h"

@implementation UIViewController (EZ_Helper)

+ (UIViewController *)ez_UIViewControllerFromView:(UIView *)view{
    UIResponder *responder = view;
    while ((responder = [responder nextResponder])){
        if ([responder isKindOfClass: [UIViewController class]]){
            return (UIViewController *)responder;
        }
    }
    return nil;
}

+ (UIViewController *)ez_presentedUIViewControllerFromViewController:(UIViewController *)viewController{
    if(viewController.presentedViewController){
        return [UIViewController ez_presentedUIViewControllerFromViewController:viewController.presentedViewController];
    }else{
        return viewController;
    }
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

@end
