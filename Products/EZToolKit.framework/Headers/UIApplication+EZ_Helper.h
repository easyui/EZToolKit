//
//  UIApplication+EZ_Helper.h
//  EZToolKit
//
//  Created by yangjun zhu on 16/3/1.
//  Copyright © 2016年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (EZ_Helper)
- (NSString *)ez_applicationFileSize;


- (void)ez_beganNetworkActivity;
- (void)ez_endedNetworkActivity;

- (CGRect)ez_keyboardFrame;

@end
