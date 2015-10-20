//
//  UIViewController+NavigationBar.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/10/19.
//  Copyright © 2015年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^EZNavigationBarButtonActionBlock)(id sender);
typedef void(^EZNavigationBarSetButtonBlock)(id sender);
typedef enum {
    EZNavigationBarButtonAsLeft = 0,
    EZNavigationBarButtonAsRight
}EZNavigationBarButtonAsPosition;

@interface UIViewController (EZ_NavigationBar)
-(void)setNavigationBarButtonPosition:(EZNavigationBarButtonAsPosition)position
                          normalImage:(UIImage *)normalImage
                     highlightedImage:(UIImage *)highlightedImage
                          actionBlock:(EZNavigationBarButtonActionBlock)actionBlock;

-(void)setNavigationBarButtonPosition:(EZNavigationBarButtonAsPosition)position
                                title:(NSString *)title
                            titleFont:(UIFont *)font
                          normalColor:(UIColor *)normalColor
                     highlightedColor:(UIColor *)highlightedColor
                          actionBlock:(EZNavigationBarButtonActionBlock)actionBlock;

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
                               offset:(CGFloat)offset //set -24 to system default, toolkit provide 24 as default offset
                       setButtonBlock:(EZNavigationBarSetButtonBlock)setButtonBlock;
@end
