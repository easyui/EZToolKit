//
//  UIViewController+NavigationBar.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/10/19.
//  Copyright © 2015年 Cactus. All rights reserved.
//

#import "UIViewController+EZ_NavigationBar.h"
#import "objc/runtime.h"
#define leftBarButtonActionBlock @"leftBarButtonActionBlock"
#define rightBarButtonActionBlock @"rightBarButtonActionBlock"
@implementation UIViewController (EZ_NavigationBar)
-(void)setNavigationBarButtonPosition:(EZNavigationBarButtonAsPosition)position
                          normalImage:(UIImage *)normalImage
                     highlightedImage:(UIImage *)highlightedImage
                          actionBlock:(EZNavigationBarButtonActionBlock)actionBlock
{
    [self setNavigationBarButtonPosition:position normalImage:normalImage highlightedImage:highlightedImage normalBgImage:nil highlightedBgImage:nil title:nil titleFont:nil normalColor:nil highlightedColor:nil switchEffect:NO actionBlock:actionBlock offset:0 setButtonBlock:nil];
}

-(void)setNavigationBarButtonPosition:(EZNavigationBarButtonAsPosition)position
                                title:(NSString *)title
                            titleFont:(UIFont *)font
                          normalColor:(UIColor *)normalColor
                     highlightedColor:(UIColor *)highlightedColor
                          actionBlock:(EZNavigationBarButtonActionBlock)actionBlock
{
    [self setNavigationBarButtonPosition:position normalImage:nil highlightedImage:nil normalBgImage:nil highlightedBgImage:nil title:title titleFont:font normalColor:normalColor highlightedColor:highlightedColor switchEffect:NO actionBlock:actionBlock offset:0 setButtonBlock:nil];
}

-(void)setNavigationBarButtonPosition:(EZNavigationBarButtonAsPosition)position
                          normalImage:(UIImage *)normalImage
                     highlightedImage:(UIImage *)highlightedImage
                        normalBgImage:(UIImage *)nomalBgImage
                   highlightedBgImage:(UIImage *)highlightedBgImage
                                title:(NSString *)title
                            titleFont:(UIFont *)font
                          normalColor:(UIColor *)normalColor
                     highlightedColor:(UIColor *)highlightedColor
                         switchEffect:(BOOL)needHighLighted
                          actionBlock:(EZNavigationBarButtonActionBlock)actionBlock
                               offset:(CGFloat)offset
                       setButtonBlock:(EZNavigationBarSetButtonBlock)setButtonBlock
{
    SEL sel = position == EZNavigationBarButtonAsLeft ? @selector(leftBarButtonAction:): @selector(rightBarButtonAction:);
    UIButton * barButton = [UIButton buttonWithType:UIButtonTypeCustom];
    barButton.frame = CGRectMake(0, 0, 45, 40);
    barButton.backgroundColor = [UIColor clearColor];
    [barButton addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    if (normalImage) {
        [barButton setImage:normalImage forState:UIControlStateNormal];
    }
    if (highlightedImage) {
        [barButton setImage:highlightedImage forState:UIControlStateHighlighted];
    }
    if (nomalBgImage) {
        [barButton setBackgroundImage:nomalBgImage forState:UIControlStateNormal];
    }
    if (highlightedBgImage) {
        [barButton setBackgroundImage:highlightedBgImage forState:UIControlStateHighlighted];
    }
    if (title) {
        [barButton setTitle:title forState:UIControlStateNormal];
    }
    if (font) {
        [barButton.titleLabel setFont:font];
    }
    if (normalColor) {
        [barButton setTitleColor:normalColor forState:UIControlStateNormal];
    }
    if (highlightedColor) {
        [barButton setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    }
    if (needHighLighted) {
        if (highlightedImage)[barButton setImage:highlightedImage forState:UIControlStateSelected];
        if (highlightedColor)[barButton setTitleColor:highlightedColor forState:UIControlStateSelected];
        if (highlightedBgImage)[barButton setBackgroundImage:highlightedBgImage forState:UIControlStateSelected];
    }
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:barButton];
    if (position == EZNavigationBarButtonAsLeft) {
        self.navigationItem.leftBarButtonItem = barButtonItem;
    }else{
        self.navigationItem.rightBarButtonItem = barButtonItem;
    }
    barButton.imageEdgeInsets = UIEdgeInsetsMake(0, position == EZNavigationBarButtonAsLeft?-(24+offset):0, 0, position == EZNavigationBarButtonAsLeft?0:-(24+offset));
    barButton.titleEdgeInsets = UIEdgeInsetsMake(0, position == EZNavigationBarButtonAsLeft?-(24+offset):0, 0, position == EZNavigationBarButtonAsLeft?0:-(24+offset));
    if (setButtonBlock) {
        setButtonBlock(barButton);
    }
    if (needHighLighted) {
        objc_setAssociatedObject(self,@"needHighLighted", @YES , OBJC_ASSOCIATION_ASSIGN);
    }
    objc_setAssociatedObject(self,position == EZNavigationBarButtonAsLeft?leftBarButtonActionBlock:rightBarButtonActionBlock, actionBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)leftBarButtonAction:(id)sender
{
    BOOL highlight = [objc_getAssociatedObject(self, @"needHighLighted") boolValue];
    if (highlight) {
        if ([sender isKindOfClass:[UIButton class]]) {
            UIButton * button = (UIButton *)sender;
            [button setSelected:!button.selected];
        }
    }
    EZNavigationBarButtonActionBlock block = objc_getAssociatedObject(self, leftBarButtonActionBlock);
    if (block) {
        block(sender);
    }
}

- (void)rightBarButtonAction:(id)sender
{
    BOOL highlight = [objc_getAssociatedObject(self, @"needHighLighted") boolValue];
    if (highlight) {
        if ([sender isKindOfClass:[UIButton class]]) {
            UIButton * button = (UIButton *)sender;
            [button setSelected:!button.selected];
        }
    }
    EZNavigationBarButtonActionBlock block = objc_getAssociatedObject(self, rightBarButtonActionBlock);
    if (block) {
        block(sender);
    }
}
@end
