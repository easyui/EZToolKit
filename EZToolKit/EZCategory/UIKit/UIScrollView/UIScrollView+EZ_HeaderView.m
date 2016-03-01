//
//  UIScrollView+EZ_HeaderView.m
//  EZToolKit
//
//  Created by yangjun zhu on 16/2/18.
//  Copyright © 2016年 Cactus. All rights reserved.
//

#import "UIScrollView+EZ_HeaderView.h"
#import <objc/runtime.h>
static CGFloat headerViewHeight;

@implementation UIScrollView (EZ_HeaderView)

-(UIView *)ez_headerView{
    return objc_getAssociatedObject(self,  @selector(ez_headerView));
}

//if set nil ,ez_headerView will be removed
-(void)setEz_headerView:(UIView *)ez_headerView{
    [self.ez_headerView removeFromSuperview];
    headerViewHeight = ez_headerView.bounds.size.height;
    self.contentInset = UIEdgeInsetsMake(ez_headerView.bounds.size.height, 0, 0, 0);
    ez_headerView.frame = CGRectMake(0, -ez_headerView.bounds.size.height, ez_headerView.bounds.size.width, ez_headerView.bounds.size.height);
    [self addSubview:ez_headerView];
    
    objc_setAssociatedObject(self, @selector(ez_headerView),
                             ez_headerView,
                             OBJC_ASSOCIATION_ASSIGN);
}

- (void)ez_updateHeaderViewDidScroll:(UIScrollView *)scrollView{
    UIView * headerView = self.ez_headerView ;
    if (!headerView ) {
        return;
    }
    UIScrollView *scroll = scrollView?scrollView:self;
    CGFloat offsetY = scroll.contentOffset.y + scroll.scrollIndicatorInsets.top;
    if(offsetY >= -headerViewHeight){
        headerView.frame = CGRectMake(0, -headerViewHeight, headerView.bounds.size.width, headerViewHeight);
    }else{
        headerView.frame = CGRectMake(0, offsetY, headerView.bounds.size.width, -offsetY);
        
    }
    
}
@end
