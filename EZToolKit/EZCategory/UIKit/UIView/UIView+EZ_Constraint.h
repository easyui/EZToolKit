//
//  UIView+EZ_Constraint.h
//  EZToolKit
//
//  Created by IQIYI on 2017/3/29.
//  Copyright © 2017年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIView (EZ_Constraint)
#pragma mark - Named Constraint Support
// Single
- (nullable NSLayoutConstraint *) ez_constraintNamed: (NSString *) aName;
- (nullable NSLayoutConstraint *) ez_constraintNamed: (NSString *) aName matchingView: (UIView *) view;

// Multiple
- (NSArray<__kindof NSLayoutConstraint *> *) ez_constraintsNamed: (NSString *) aName;
- (NSArray<__kindof NSLayoutConstraint *> *) ez_constraintsNamed: (NSString *) aName matchingView: (UIView *) view;

#pragma mark - Managing Matching Constraints

@end
NS_ASSUME_NONNULL_END
