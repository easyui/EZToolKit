//
//  UIScrollView+EZ_Navigationbar.h
//  EZToolKit
//
//  Created by yangjun zhu on 16/2/18.
//  Copyright © 2016年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (EZ_Navigationbar)
@property (nonatomic, weak) UINavigationBar *ez_navigationBar;

- (void)ez_startUpdateNavigationBarHeight;
- (void)ez_stopUpdateNavigationBarHeight;
- (void)ez_updateNavigationBarHeightDidScroll:(UIScrollView *)scrollView;
- (void)ez_hiddenNavigationBarDidScroll:(UIScrollView *)scrollView animateWithDuration:(NSTimeInterval)duration;



@property (nonatomic, assign) CGFloat ez_startPosition;
@property (nonatomic, assign) CGFloat ez_duration;
@property (nonatomic, strong) UIColor *ez_navigationBarBackgroundColor;
- (void)ez_startUpdateNavigationBarAlpha:(UIScrollView *)scrollView;
- (void)ez_stopUpdateNavigationBarAlpha;
- (void)ez_updateNavigationBarAlphaDidScroll:(UIScrollView *)scrollView;
@end
