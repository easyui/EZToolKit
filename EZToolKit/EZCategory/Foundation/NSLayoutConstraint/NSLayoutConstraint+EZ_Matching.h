//
//  NSLayoutConstraint+EZ_Matching.h
//  EZToolKit
//
//  Created by yangjun zhu on 2017/3/29.
//  Copyright © 2017年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSLayoutConstraint (EZ_Matching)

- (BOOL) ez_isEqualToLayoutConstraint: (NSLayoutConstraint *) constraint;
- (BOOL) ez_isEqualToLayoutConstraintConsideringPriority: (NSLayoutConstraint *) constraint;
- (BOOL) ez_refersToView: (UIView *) theView;
@end
NS_ASSUME_NONNULL_END
