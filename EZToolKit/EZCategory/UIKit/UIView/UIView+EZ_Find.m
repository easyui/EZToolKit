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

- (nullable id)ez_findSubViewWithSubViewClass:(Class)clazz
{
    for (id subView in self.subviews) {
        if ([subView isKindOfClass:clazz]) {
            return subView;
        }
    }
    
    return nil;
}

- (nullable id)ez_findsuperViewWithSuperViewClass:(Class)clazz
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

- (nullable UIView *)ez_findFirstResponder {
    
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


/**
 返回所有父视图

 @return 所有父视图
 */
-(NSArray *)ez_superviews{
    NSMutableArray *array = [NSMutableArray array];
    UIView *view = self.superview;
    while (view)
    {
        [array addObject:view];
        view = view.superview;
    }
    return array;
}

/**
 返回所有子视图（递归）


 @return 所有子视图
 */
-(NSArray *)ez_allSubviews{
    NSMutableArray *array = [NSMutableArray array];
    
    for (UIView *view in self.subviews)
    {
        [array addObject:view];
        [array addObjectsFromArray:[view ez_allSubviews]];
    }
    return array;
}

/**
 是否是aView的一个父视图

 @param aView 被检查视图
 @return 是aView的一个父视图返回YES
 */
- (BOOL) ez_isAncestorOf:(__kindof UIView *)aView{
    return [aView.ez_superviews containsObject:self];
}


/**
 返回2个视图最近的父视图，不存在返回nil

 @param aView 被检查的一个视图
 @return 最近的父视图，不存在返回nil
 */
- (nullable __kindof UIView *) ez_nearestCommonAncestor: (__kindof UIView *) aView{
    // Check for same view
    if (self == aView)
        return self;
    
    // Check for direct superview relationship
    if ([self ez_isAncestorOf:aView])
        return self;
    if ([aView ez_isAncestorOf:self])
        return aView;
    
    // Search for indirect common ancestor
    NSArray *ancestors = self.ez_superviews;
    for (UIView *view in aView.ez_superviews)
        if ([ancestors containsObject:view])
            return view;
    
    // No common ancestor
    return nil;}
@end
