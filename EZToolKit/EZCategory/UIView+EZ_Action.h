//
//  UIView+EZ_Action.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (EZ_Action)
/**
 Attaches the given block for a single tap action to the receiver.
 @param block The block to execute.
 */
- (void)ez_setTapActionWithBlock:(void (^)(void))block;

/**
 Attaches the given block for a long press action to the receiver.
 @param block The block to execute.
 */
- (void)ez_setLongPressActionWithBlock:(void (^)(void))block;
@end
