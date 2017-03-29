//
//  UIView+EZ_Constraint.m
//  EZToolKit
//
//  Created by yangjun zhu on 2017/3/29.
//  Copyright © 2017年 Cactus. All rights reserved.
//

#import "UIView+EZ_Constraint.h"
#import "NSObject+EZ_Helper.h"
#import "UIView+EZ_Find.h"
#import "NSLayoutConstraint+EZ_Matching.h"
#import "NSLayoutConstraint+EZ_Helper.h"

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

#pragma mark - Managing Matching Constraints
// Ancestor constraints pointing to self
-(NSArray<NSLayoutConstraint *> *)ez_allConstraints{
    NSMutableArray *array = [NSMutableArray array];
    [array addObjectsFromArray:self.constraints];
    for (UIView *view in self.subviews)
        [array addObjectsFromArray:[view ez_allConstraints]];
    return array;
}

// Ancestor *and* self constraints pointing to self
- (NSArray<NSLayoutConstraint *> *)ez_referencingConstraintsInSuperviews{
    NSMutableArray *array = [NSMutableArray array];
    for (UIView *view in self.ez_superviews)
    {
        for (NSLayoutConstraint *constraint in view.constraints)
        {
            if (![constraint.class isEqual:[NSLayoutConstraint class]])
                continue;
            
            if ([constraint ez_refersToView:self])
                [array addObject:constraint];
        }
    }
    return array;
}

// Ancestor *and* self constraints pointing to self
- (NSArray<NSLayoutConstraint *> *)ez_referencingConstraints{
    NSMutableArray *array = [self.ez_referencingConstraintsInSuperviews mutableCopy];
    for (NSLayoutConstraint *constraint in self.constraints)
    {
        if (![constraint.class isEqual:[NSLayoutConstraint class]])
            continue;
        
        if ([constraint ez_refersToView:self])
            [array addObject:constraint];
    }
    return array;
}

// Find first matching constraint. (Priority, Archiving ignored)
- (nullable NSLayoutConstraint *) ez_constraintMatchingConstraint: (NSLayoutConstraint *) aConstraint
{
    NSArray *views = [@[self] arrayByAddingObjectsFromArray:self.ez_superviews];
    for (UIView *view in views)
        for (NSLayoutConstraint *constraint in view.constraints)
            if ([constraint ez_isEqualToLayoutConstraint:aConstraint])
                return constraint;
    
    return nil;
}
// Find all matching constraints. (Priority, archiving ignored)
// Use with arrays returned by format strings to find installed versions
- (NSArray<NSLayoutConstraint *> *) ez_constraintsMatchingConstraints: (NSArray *) constraints
{
    NSMutableArray *array = [NSMutableArray array];
    for (NSLayoutConstraint *constraint in constraints)
    {
        NSLayoutConstraint *match = [self ez_constraintMatchingConstraint:constraint];
        if (match)
            [array addObject:match];
    }
    return array;
}

// All constraints matching view in this ascent
// See also: referencingConstraints and referencingConstraintsInSuperviews
- (NSArray *) ez_constraintsReferencingView: (UIView *) theView
{
    NSMutableArray *array = [NSMutableArray array];
    NSArray *views = [@[self] arrayByAddingObjectsFromArray:self.ez_superviews];
    
    for (UIView *view in views)
        for (NSLayoutConstraint *constraint in view.constraints)
        {
            if (![constraint.class isEqual:[NSLayoutConstraint class]])
                continue;
            
            if ([constraint ez_refersToView:theView])
                [array addObject:constraint];
        }
    
    return array;
}


// Remove constraint
- (BOOL) ez_removeMatchingConstraint: (NSLayoutConstraint *) aConstraint
{
    NSLayoutConstraint *match = [self ez_constraintMatchingConstraint:aConstraint];
    if (match){
        return  [match ez_remove];
    }
    return NO;
}

// Remove constraints
// Use for removing constraings generated by format
- (void) ez_removeMatchingConstraints: (NSArray *) anArray
{
    for (NSLayoutConstraint *constraint in anArray)
        [self ez_removeMatchingConstraint:constraint];
}

// Remove constraints via name
- (void) ez_removeConstraintsNamed: (NSString *) name
{
    NSArray *array = [self ez_constraintsNamed:name];
    for (NSLayoutConstraint *constraint in array)
        [constraint ez_remove];
}

// Remove named constraints matching view
- (void) ez_removeConstraintsNamed: (NSString *) name matchingView: (UIView *) theView
{
    NSArray *array = [self ez_constraintsNamed:name matchingView:theView];
    for (NSLayoutConstraint *constraint in array)
        [constraint ez_remove];
}

@end
