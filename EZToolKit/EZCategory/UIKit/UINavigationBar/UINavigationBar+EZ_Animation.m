//
//  UINavigationBar+EZ_Animation.m
//  EZToolKit
//
//  Created by yangjun zhu on 16/2/19.
//  Copyright © 2016年 Cactus. All rights reserved.
//

#import "UINavigationBar+EZ_Animation.h"
#import <objc/runtime.h>
@interface UINavigationBar ()
@property (nonatomic, strong) UIView *ez_overlay;
@end
@implementation UINavigationBar (EZ_Animation)


- (UIView *)ez_overlay
{
    return objc_getAssociatedObject(self, @selector(ez_overlay));
}

- (void)setEz_overlay:(UIView *)ez_overlay
{
    objc_setAssociatedObject(self, @selector(ez_overlay), ez_overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)ez_setBackgroundColor:(UIColor *)backgroundColor
{
    if (!backgroundColor){
        [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [self.ez_overlay removeFromSuperview];
        self.ez_overlay = nil;
        return;
    }
    
    if (!self.ez_overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.ez_overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.bounds) + 20)];
        self.ez_overlay.userInteractionEnabled = NO;
        self.ez_overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.ez_overlay atIndex:0];
    }
    self.ez_overlay.backgroundColor = backgroundColor;
}

- (void)ez_setTranslationY:(CGFloat)translationY
{
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}

- (void)ez_setElementsAlpha:(CGFloat)alpha
{
    [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    UIView *titleView = [self valueForKey:@"_titleView"];
    titleView.alpha = alpha;
    //    when viewController first load, the titleView maybe nil
    [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:NSClassFromString(@"UINavigationItemView")]) {
            obj.alpha = alpha;
            *stop = YES;
        }
    }];
}

@end
