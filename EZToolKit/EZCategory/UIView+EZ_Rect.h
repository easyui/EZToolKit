//
//  UIView+EZ_Rect.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/21.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (EZ_Rect)

/////////////////////////////////////////////////////////////////////////
#pragma mark - Frame get/set shorthand
/////////////////////////////////////////////////////////////////////////

/** Frame origin/size */
@property (nonatomic, assign) CGPoint ez_origin;
@property (nonatomic, assign) CGFloat ez_x;
@property (nonatomic, assign) CGFloat ez_y;

@property (nonatomic, assign) CGSize ez_size;
@property (nonatomic, assign) CGFloat ez_width;
@property (nonatomic, assign) CGFloat ez_height;

@property (nonatomic, assign) CGFloat ez_centerX;
@property (nonatomic, assign) CGFloat ez_centerY;


/////////////////////////////////////////////////////////////////////////
#pragma mark - Bounds shorthand
/////////////////////////////////////////////////////////////////////////

@property (nonatomic, assign) CGSize ez_boundsSize;
@property (nonatomic, assign) CGFloat ez_boundsWidth;
@property (nonatomic, assign) CGFloat ez_boundsHeight;


/////////////////////////////////////////////////////////////////////////
#pragma mark - Additional setters
/////////////////////////////////////////////////////////////////////////

/** Centers view in superview.
 @throws NSGenericException if superview = nil */
- (void)ez_alignCenterHorizontally;

/** Centers view in superview.
 @throws NSGenericException if superview = nil */
- (void)ez_alignCenterVertically;

/** Centers view in superview.
 @throws NSGenericException if superview = nil */
- (void)ez_alignCenter;

/** Aligns right edge to that of the superview.
 @throws NSGenericException if superview = nil */
- (void)ez_alignRight;

/** Aligns bottom edge to that of the superview.
 @throws NSGenericException if superview = nil */
- (void)ez_alignBottom;

/** Layout with respect to the superview.
 @throws NSGenericException if superview = nil */
- (void)ez_setMargins:(UIEdgeInsets)margins;

/** Positions the view a given distance from the bottom boundary of the superview changing the frame origin (as opposed to the size)
 @throws NSGenericException if superview = nil */
- (void)ez_setBottomMargin:(CGFloat)bottom;

@end
