//
//  UIView+EZ_Constraint.h
//  EZToolKit
//
//  Created by yangjun zhu on 2017/3/29.
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
@property (nonatomic, readonly) NSArray<__kindof NSLayoutConstraint *> *ez_allConstraints;
@property (nonatomic, readonly) NSArray<__kindof NSLayoutConstraint *> *ez_referencingConstraintsInSuperviews;
@property (nonatomic, readonly) NSArray<__kindof NSLayoutConstraint *> *ez_referencingConstraints;


// Retrieving constraints
- (nullable NSLayoutConstraint *) ez_constraintMatchingConstraint: (NSLayoutConstraint *) aConstraint;
- (NSArray<NSLayoutConstraint *> *) ez_constraintsMatchingConstraints: (NSArray *) constraints;

// Constraints referencing a given view
- (NSArray *) ez_constraintsReferencingView: (UIView *) theView;

// Removing matching constraints
- (BOOL) ez_removeMatchingConstraint: (NSLayoutConstraint *) aConstraint;
- (void) ez_removeMatchingConstraints: (NSArray *) anArray;

// Removing named constraints
- (void) ez_removeConstraintsNamed: (NSString *) name;
- (void) ez_removeConstraintsNamed: (NSString *) name matchingView: (UIView *) theView;



@end
NS_ASSUME_NONNULL_END
