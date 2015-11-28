//
//  UIView+EZ_Find.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/11/27.
//  Copyright © 2015年 Cactus. All rights reserved.
//

#import "UIView+EZ_Find.h"

@implementation UIView (EZ_Find)
- (UIViewController *)ez_viewController
{    
    UIResponder *responder = self;
    while ((responder = [responder nextResponder])){
        if ([responder isKindOfClass: [UIViewController class]]){
            return (UIViewController *)responder;
        }
    }
    return nil;
}

- (id)ez_findSubViewWithSubViewClass:(Class)clazz
{
    for (id subView in self.subviews) {
        if ([subView isKindOfClass:clazz]) {
            return subView;
        }
    }
    
    return nil;
}

- (id)ez_findsuperViewWithSuperViewClass:(Class)clazz
{
    if (self == nil) {
        return nil;
    } else if (self.superview == nil) {
        return nil;
    } else if ([self.superview isKindOfClass:clazz]) {
        return self.superview;
    } else {
        return [self.superview ez_findsuperViewWithSuperViewClass:clazz];
    }
}

- (BOOL)ez_findAndResignFirstResponder {
    if (self.isFirstResponder) {
        [self resignFirstResponder];
        return YES;
    }
    
    for (UIView *v in self.subviews) {
        if ([v ez_findAndResignFirstResponder]) {
            return YES;
        }
    }
    
    return NO;
}

- (UIView *)ez_findFirstResponder {
    
    if (([self isKindOfClass:[UITextField class]] || [self isKindOfClass:[UITextView class]])
        && (self.isFirstResponder)) {
        return self;
    }
    
    for (UIView *v in self.subviews) {
        UIView *fv = [v ez_findFirstResponder];
        if (fv) {
            return fv;
        }
    }
    
    return nil;
}
@end
