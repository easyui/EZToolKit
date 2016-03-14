//
//  UIViewController+EZ_Helper.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import "UIViewController+EZ_Helper.h"

@implementation UIViewController (EZ_Helper)



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


- (CGFloat)ez_statusBarHeight{
   return  [self.view.window convertRect:[UIApplication sharedApplication].statusBarFrame toView:self.view].size.height;
}

- (CGFloat)ez_navigationBarHeight{
   return  self.navigationController.navigationBar.frame.size.height;
}
@end
