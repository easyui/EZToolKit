//
//  UIView+EZ_Rect.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/21.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import "UIView+EZ_Rect.h"

@implementation UIView (EZ_Rect)
/////////////////////////////////////////////////////////////////////////
#pragma mark - Frame get/set shorthand
/////////////////////////////////////////////////////////////////////////

- (CGPoint)ez_origin
{
    return self.frame.origin;
}

//---------------------------------------------------------------------

-(void)setEz_origin:(CGPoint)ez_origin{
    CGRect f = self.frame;
    f.origin = ez_origin;
    self.frame = f;
}
//---------------------------------------------------------------------

- (CGFloat)ez_x
{
    return self.ez_origin.x;
}

//---------------------------------------------------------------------

- (void)setEz_x:(CGFloat)ez_x{
    CGRect f = self.frame;
    f.origin.x = ez_x;
    self.frame = f;
}

//---------------------------------------------------------------------

- (CGFloat)ez_y
{
    return self.ez_origin.y;
}

//---------------------------------------------------------------------

- (void)setEz_y:(CGFloat)ez_y{
    CGRect f = self.frame;
    f.origin.y = ez_y;
    self.frame = f;
}


//---------------------------------------------------------------------

- (CGSize)ez_size
{
    return self.frame.size;
}

//---------------------------------------------------------------------

- (void)setEz_size:(CGSize)ez_size{
    CGRect f = self.frame;
    f.size = ez_size;
    self.frame = f;
}

//---------------------------------------------------------------------

- (CGFloat)ez_width
{
    return self.ez_size.width;
}

//---------------------------------------------------------------------

- (void)setEz_width:(CGFloat)ez_width{
    CGRect f = self.frame;
    f.size.width = ez_width;
    self.frame = f;
}

//---------------------------------------------------------------------

- (CGFloat)ez_height
{
    return self.ez_size.height;
}

//---------------------------------------------------------------------

- (void)setEz_height:(CGFloat)ez_height{
    CGRect f = self.frame;
    f.size.height = ez_height;
    self.frame = f;
}

//---------------------------------------------------------------------

- (CGFloat)ez_centerX
{
    return self.center.x;
}

//---------------------------------------------------------------------

- (void)setEz_centerX:(CGFloat)ez_centerX{
    self.center = CGPointMake(ez_centerX, self.center.y);
}


//---------------------------------------------------------------------

- (CGFloat)ez_centerY
{
    return self.center.y;
}

//---------------------------------------------------------------------


- (void)setEz_centerY:(CGFloat)ez_centerY{
  self.center = CGPointMake(self.center.x, ez_centerY);
}


/////////////////////////////////////////////////////////////////////////
#pragma mark - Bounds shorthand
/////////////////////////////////////////////////////////////////////////

- (CGSize)ez_boundsSize
{
    return self.bounds.size;
}

//---------------------------------------------------------------------

- (void)setEz_boundsSize:(CGSize)ez_boundsSize{
    CGRect bounds = self.bounds;
    bounds.size = ez_boundsSize;
    self.bounds = bounds;
}

//---------------------------------------------------------------------

- (CGFloat)ez_boundsWidth
{
    return self.ez_boundsSize.width;
}

//---------------------------------------------------------------------

- (void)setEz_boundsWidth:(CGFloat)ez_boundsWidth{
    CGRect bounds = self.bounds;
    bounds.size.width = ez_boundsWidth;
    self.bounds = bounds;
}

//---------------------------------------------------------------------

- (CGFloat)ez_boundsHeight
{
    return self.ez_boundsSize.height;
}

//---------------------------------------------------------------------

- (void)setEz_boundsHeight:(CGFloat)ez_boundsHeight{
    CGRect bounds = self.bounds;
    bounds.size.height = ez_boundsHeight;
    self.bounds = bounds;
}


/////////////////////////////////////////////////////////////////////////
#pragma mark - Additional setters
/////////////////////////////////////////////////////////////////////////

- (void)ez_alignCenterHorizontally
{
    if (!self.superview) [NSException raise:NSGenericException format:@"Superview must not be nil"];
    CGPoint center = self.center;
    center.x = self.superview.frame.size.width * 0.5;
    self.center = center;
}

//---------------------------------------------------------------------

- (void)ez_alignCenterVertically
{
    if (!self.superview) [NSException raise:NSGenericException format:@"Superview must not be nil"];
    CGPoint center = self.center;
    center.y = self.superview.frame.size.height * 0.5;
    self.center = center;
}

//---------------------------------------------------------------------

- (void)ez_alignCenter
{
    if (!self.superview) [NSException raise:NSGenericException format:@"Superview must not be nil"];
    CGPoint center = self.center;
    center.x = self.superview.frame.size.width * 0.5;
    center.y = self.superview.frame.size.height * 0.5;
    self.center = center;
}

//---------------------------------------------------------------------

- (void)ez_alignRight
{
    if (!self.superview) [NSException raise:NSGenericException format:@"Superview must not be nil"];
    CGRect frame = self.frame;
    frame.origin.x = self.superview.frame.size.width - frame.size.width;
    self.frame = frame;
}

//---------------------------------------------------------------------

- (void)ez_alignBottom
{
    if (!self.superview) [NSException raise:NSGenericException format:@"Superview must not be nil"];
    CGRect frame = self.frame;
    frame.origin.y = self.superview.frame.size.height - frame.size.height;
    self.frame = frame;
}

//---------------------------------------------------------------------


- (void)ez_setMargins:(UIEdgeInsets)margins
{
    if (!self.superview) [NSException raise:NSGenericException format:@"Superview must not be nil"];
    CGSize superSize = self.superview.frame.size;
    self.frame = CGRectMake(margins.left,
                            margins.top,
                            superSize.width - (margins.left + margins.right),
                            superSize.height - (margins.top + margins.bottom));
}

//---------------------------------------------------------------------

- (void)ez_setBottomMargin:(CGFloat)bottom
{
    if (!self.superview) [NSException raise:NSGenericException format:@"Superview must not be nil"];
    CGRect f = self.frame;
    f.origin.y = self.superview.frame.size.height - self.frame.size.height - bottom;
    self.frame = f;
}



#pragma mark - view methods
- (CGFloat)ez_viewGetWidth{
    if ((NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1)) {
        return  CGRectGetWidth(self.frame);
    }else{
        return UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)?CGRectGetHeight(self.frame):CGRectGetWidth(self.frame);
    }
}

- (CGFloat)ez_viewGetHeight{
    if ((NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1)) {
        return  CGRectGetHeight(self.frame);
    }else{
        return UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)?CGRectGetWidth(self.frame):CGRectGetHeight(self.frame);
    }
}


@end
