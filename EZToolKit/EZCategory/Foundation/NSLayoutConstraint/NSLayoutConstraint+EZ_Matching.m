//
//  NSLayoutConstraint+EZ_Matching.m
//  EZToolKit
//
//  Created by yangjun zhu on 2017/3/29.
//  Copyright © 2017年 Cactus. All rights reserved.
//

#import "NSLayoutConstraint+EZ_Matching.h"

@implementation NSLayoutConstraint (EZ_Matching)

- (BOOL) ez_isEqualToLayoutConstraint: (NSLayoutConstraint *) constraint{
    // I'm still wavering on these two checks
    if (![self.class isEqual:[NSLayoutConstraint class]]) return NO;
    if (![self.class isEqual:constraint.class]) return NO;
    
    // Compare properties
    if (self.firstItem != constraint.firstItem) return NO;
    if (self.secondItem != constraint.secondItem) return NO;
    if (self.firstAttribute != constraint.firstAttribute) return NO;
    if (self.secondAttribute != constraint.secondAttribute) return NO;
    if (self.relation != constraint.relation) return NO;
    if (self.multiplier != constraint.multiplier) return NO;
    if (self.constant != constraint.constant) return NO;
    
    return YES;
}

- (BOOL) ez_isEqualToLayoutConstraintConsideringPriority: (NSLayoutConstraint *) constraint{
    if (![self ez_isEqualToLayoutConstraint:constraint])
        return NO;
    
    return (self.priority == constraint.priority);

}
- (BOOL) ez_refersToView: (UIView *) theView{
    if (!theView)
        return NO;
    if (!self.firstItem) // shouldn't happen. Illegal
        return NO;
    if (self.firstItem == theView)
        return YES;
    if (!self.secondItem)
        return NO;
    return (self.secondItem == theView);
}
@end
