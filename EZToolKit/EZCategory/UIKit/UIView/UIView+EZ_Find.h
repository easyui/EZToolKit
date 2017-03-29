//
//  UIView+EZ_Find.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/11/27.
//  Copyright © 2015年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIView (EZ_Find)
@property (readonly) UIViewController *ez_viewController;

- (id)ez_findSubViewWithSubViewClass:(Class)clazz;
- (id)ez_findsuperViewWithSuperViewClass:(Class)clazz;

- (BOOL)ez_findAndResignFirstResponder;
- (UIView *)ez_findFirstResponder;


@property (nonatomic, readonly, copy) NSArray<__kindof UIView *> *ez_superviews;
@property (nonatomic, readonly, copy) NSArray<__kindof UIView *> *ez_allSubviews;
- (BOOL) ez_isAncestorOf: (__kindof UIView *) aView;
- (nullable __kindof UIView *) ez_nearestCommonAncestor: (__kindof UIView *) aView;
@end
NS_ASSUME_NONNULL_END
