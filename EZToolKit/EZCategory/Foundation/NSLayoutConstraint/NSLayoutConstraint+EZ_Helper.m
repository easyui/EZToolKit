//
//  NSLayoutConstraint+EZ_Helper.m
//  EZToolKit
//
//  Created by yangjun zhu on 2017/3/29.
//  Copyright © 2017年 Cactus. All rights reserved.
//

#import "NSLayoutConstraint+EZ_Helper.h"
#import "UIView+EZ_Find.h"

@implementation NSLayoutConstraint (EZ_Helper)
-(UIView *)ez_firstView{
    return self.firstItem;
}

-(UIView *)ez_secondView{
    return self.secondItem;
}

-(BOOL)ez_isUnary{
    return self.secondItem == nil;
}

/**
 最近的父视图

 @return 最近的父视图
 */
-(UIView *)ez_nearestCommonAncestor{
    if (self.ez_isUnary){
        return self.ez_firstView;
    }
    
    return [self.ez_firstView ez_nearestCommonAncestor:self.ez_secondView];
}
- (BOOL) ez_install{
    // Handle Unary constraint
    if (self.ez_isUnary)
    {
        // Add weak owner reference
        [self.ez_firstView addConstraint:self];
        return YES;
    }
    
    // Install onto nearest common ancestor
    UIView *view = [self.ez_firstView ez_nearestCommonAncestor:self.ez_secondView];
    if (!view)
    {
        NSLog(@"Error: Constraint cannot be installed. No common ancestor between items.");
        return NO;
    }
    
    [view addConstraint:self];
    return YES;

}

- (BOOL) ez_install: (float) priority{
    self.priority = priority;
    return [self ez_install];
}

- (BOOL) ez_remove{
    if (![self.class isEqual:[NSLayoutConstraint class]])
    {
        NSLog(@"Error: Can only uninstall NSLayoutConstraint. %@ is an invalid class.", self.class.description);
        return NO;
    }
    
    if (self.ez_isUnary)
    {
        [self.ez_firstView removeConstraint:self];
        return YES;
    }
    
    // Remove from preferred recipient
    UIView *view = [self.ez_firstView ez_nearestCommonAncestor:self.ez_secondView];
    if (!view) {return NO;}
    
    // If the constraint not on view, this is a no-op
    [view removeConstraint:self];
    return YES;
}
@end
