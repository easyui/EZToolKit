//
//  UIView+EZ_Constraint.m
//  EZToolKit
//
//  Created by IQIYI on 2017/3/29.
//  Copyright © 2017年 Cactus. All rights reserved.
//

#import "UIView+EZ_Constraint.h"
#import "NSObject+EZ_Helper.h"

@implementation UIView (EZ_Constraint)
#pragma mark - Named Constraint Support

/**
 返回nameTag是aName的第一个约束，遍历父视图

 @param aName nameTag的值
 @return 符合要求的第一个约束
 */
- (nullable NSLayoutConstraint *) ez_constraintNamed: (NSString *) aName
{
    if (!aName) return nil;
    for (NSLayoutConstraint *constraint in self.constraints)
        if (constraint.nameTag && [constraint.nameTag isEqualToString:aName])
            return constraint;
    
    // Recurse up the tree
    if (self.superview)
        return [self.superview ez_constraintNamed:aName];
    
    return nil;
}


/**
 返回nameTag是aName且这个约束的firstItem或secondItem是theView的第一个约束，遍历父视图


 @param aName nameTag的值
 @param theView 约束作用的视图
 @return 符合要求的第一个约束
 */
- (nullable NSLayoutConstraint *) ez_constraintNamed: (NSString *) aName matchingView: (UIView *) theView
{
    if (!aName) return nil;
    
    for (NSLayoutConstraint *constraint in self.constraints)
        if (constraint.nameTag && [constraint.nameTag isEqualToString:aName])
        {
            if (constraint.firstItem == theView)
                return constraint;
            if (constraint.secondItem && (constraint.secondItem == theView))
                return constraint;
        }
    
    // Recurse up the tree
    if (self.superview)
        return [self.superview ez_constraintNamed:aName matchingView:theView];
    
    return nil;
}


/**
 返回nameTag是aName的所有约束，遍历父视图


 @param aName nameTag的值
 @return 符合要求的所有约束
 */
- (NSArray<__kindof NSLayoutConstraint *> *) ez_constraintsNamed: (NSString *) aName
{
    // For this, all constraints match a nil item
    if (!aName) return self.constraints;
    
    // However, constraints have to have a name to match a non-nil name
    NSMutableArray *array = [NSMutableArray array];
    for (NSLayoutConstraint *constraint in self.constraints)
        if (constraint.nameTag && [constraint.nameTag isEqualToString:aName])
            [array addObject:constraint];
    
    // recurse upwards
    if (self.superview)
        [array addObjectsFromArray:[self.superview ez_constraintsNamed:aName]];
    
    return array;
}


/**
 返回nameTag是aName且这个约束的firstItem或secondItem是theView的所有约束，遍历父视图
 
 
 @param aName nameTag的值
 @param theView 约束作用的视图
 @return 符合要求的所有约束
 */
- (NSArray<__kindof NSLayoutConstraint *> *) ez_constraintsNamed: (NSString *) aName matchingView: (UIView *) theView
{
    // For this, all constraints match a nil item
    if (!aName) return self.constraints;
    
    // However, constraints have to have a name to match a non-nil name
    NSMutableArray *array = [NSMutableArray array];
    for (NSLayoutConstraint *constraint in self.constraints)
        if (constraint.nameTag && [constraint.nameTag isEqualToString:aName])
        {
            if (constraint.firstItem == theView)
                [array addObject:constraint];
            else if (constraint.secondItem && (constraint.secondItem == theView))
                [array addObject:constraint];
        }
    
    // recurse upwards
    if (self.superview)
        [array addObjectsFromArray:[self.superview ez_constraintsNamed:aName matchingView:theView]];
    
    return array;
}
@end
