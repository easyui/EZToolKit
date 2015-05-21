//
//  UIView+EZ_Helper.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (EZ_Helper)
//<ios7
- (UIImage *)ez_snapshotImage;
//>=ios7
- (UIImage *)ez_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;
@end
