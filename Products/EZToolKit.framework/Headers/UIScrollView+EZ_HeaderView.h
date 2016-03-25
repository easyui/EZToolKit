//
//  UIScrollView+EZ_HeaderView.h
//  EZToolKit
//
//  Created by yangjun zhu on 16/2/18.
//  Copyright © 2016年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (EZ_HeaderView)

@property (nonatomic, weak) UIView *ez_headerView;


- (void)ez_updateHeaderViewDidScroll:(UIScrollView *)scrollView;

@end
