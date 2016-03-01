//
//  UIScrollView+EZ_Navigationbar.m
//  EZToolKit
//
//  Created by yangjun zhu on 16/2/18.
//  Copyright © 2016年 Cactus. All rights reserved.
//

#import "UIScrollView+EZ_Navigationbar.h"
#import "UINavigationBar+EZ_Animation.h"

#import <objc/runtime.h>


static const CGFloat navigationBarHeight = 44.0;
static CGFloat scrolledHeight = 0.0;
static BOOL scrollEnable = YES;
static BOOL alphaEnable = YES;


@implementation UIScrollView (EZ_Navigationbar)


- (UINavigationBar *)ez_navigationBar{
    return objc_getAssociatedObject(self,  @selector(ez_navigationBar));
}



- (void)setEz_navigationBar:(UINavigationBar *)ez_navigationBar{
    objc_setAssociatedObject(self, @selector(ez_navigationBar),
                             ez_navigationBar,
                             OBJC_ASSOCIATION_ASSIGN);
}


#pragma mark - NavigationBarHeight

- (void)ez_startUpdateNavigationBarHeight{
    scrollEnable = YES;
}

- (void)ez_stopUpdateNavigationBarHeight{
    scrollEnable = NO;
    [self.ez_navigationBar ez_setTranslationY:0];
    [self.ez_navigationBar ez_setElementsAlpha:(1)];
}

- (void)ez_updateNavigationBarHeightDidScroll:(UIScrollView *)scrollView{
    if (!scrollEnable) {
        return;
    }
    
    UINavigationBar *navigationBar = self.ez_navigationBar;
    if (!navigationBar) {
        return;
    }
    //    NSLog(@"——————%f",self.contentOffset.y);
    //    NSLog(@"——————%f",self.contentInset.top);
    //    NSLog(@"——————%f",self.scrollIndicatorInsets.top);
    UIScrollView *scroll = scrollView?scrollView:self;
    CGFloat offsetY = scroll.contentOffset.y + scroll.contentInset.top ;
    //    NSLog(@"%f",offsetY);
    if (offsetY > 0) {
        if (offsetY >= 44 ) {
            [self __ez_setNavigationBarTransformProgress:1];
        } else {
            [self __ez_setNavigationBarTransformProgress:(offsetY / navigationBarHeight)];
        }
    } else {
        [self __ez_setNavigationBarTransformProgress:0];
    }
}

- (void)__ez_setNavigationBarTransformProgress:(CGFloat)progress
{
    scrolledHeight = (-navigationBarHeight * progress);
    [self.ez_navigationBar ez_setTranslationY:scrolledHeight];
    [self.ez_navigationBar ez_setElementsAlpha:(1-progress)];
}

#pragma mark - NavigationBarAlpha

- (UIColor *)ez_navigationBarBackgroundColor{
    return objc_getAssociatedObject(self,  @selector(ez_navigationBarBackgroundColor));
    
}

- (void)setEz_navigationBarBackgroundColor:(UIColor *)ez_navigationBarBackgroundColor{
    [self.ez_navigationBar setShadowImage:[UIImage new]];
    objc_setAssociatedObject(self, @selector(ez_navigationBarBackgroundColor),
                             ez_navigationBarBackgroundColor,
                             OBJC_ASSOCIATION_RETAIN);
}


- (CGFloat)ez_startPosition{
    CGFloat startPosition = {0};
    [objc_getAssociatedObject(self, @selector(ez_startPosition)) getValue:&startPosition];
    return startPosition;
}

- (void)setEz_startPosition:(CGFloat)ez_startPosition{
    NSValue *valueObj = [NSValue valueWithBytes:&ez_startPosition objCType:@encode(CGFloat)];
    objc_setAssociatedObject(self, @selector(ez_startPosition), valueObj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)ez_duration{
    CGFloat duration = {0};
    [objc_getAssociatedObject(self, @selector(ez_duration)) getValue:&duration];
    return duration;
}

- (void)setEz_duration:(CGFloat)ez_duration{
    NSValue *valueObj = [NSValue valueWithBytes:&ez_duration objCType:@encode(CGFloat)];
    objc_setAssociatedObject(self, @selector(ez_duration), valueObj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)ez_startUpdateNavigationBarAlpha:(UIScrollView *)scrollView{
    alphaEnable = YES;
    [self ez_updateNavigationBarAlphaDidScroll:scrollView];
}

- (void)ez_stopUpdateNavigationBarAlpha{
    alphaEnable = NO;
    UINavigationBar *navigationBar = self.ez_navigationBar;
    UIColor * backgroundColorlor = self.ez_navigationBarBackgroundColor;
    if (!navigationBar || !backgroundColorlor) {
        return;
    }
    [navigationBar ez_setBackgroundColor:[backgroundColorlor colorWithAlphaComponent:1]];
    
}


- (void)ez_updateNavigationBarAlphaDidScroll:(UIScrollView *)scrollView{
    if (!alphaEnable) {
        return;
    }
    
    UINavigationBar *navigationBar = self.ez_navigationBar;
    UIColor * backgroundColorlor = self.ez_navigationBarBackgroundColor;
    if (!navigationBar || !backgroundColorlor) {
        return;
    }
    
    CGFloat startPosition = self.ez_startPosition;
    CGFloat duration = self.ez_duration;
    
    UIScrollView *scroll = scrollView?scrollView:self;
    CGFloat offsetY = scroll.contentOffset.y + scroll.contentInset.top ;
    if (offsetY > startPosition) {
        CGFloat alpha = MIN(1, 1 - ((startPosition + duration - offsetY) / duration));
        [navigationBar ez_setBackgroundColor:[backgroundColorlor colorWithAlphaComponent:alpha]];
    } else {
        [navigationBar ez_setBackgroundColor:[backgroundColorlor colorWithAlphaComponent:0]];
    }
    
}


@end
