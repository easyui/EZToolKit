//
//  UILabel+EZ_Rect.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import "UILabel+EZ_Rect.h"
#define SystemVersionGreaterOrEqualThan(version) ([[[UIDevice currentDevice] systemVersion] floatValue] >= (version))
@implementation UILabel (EZ_Rect)
- (CGFloat)ez_textHeight
{
    if (self.text.length == 0) {
        return 0.f;
    }
    
    if (SystemVersionGreaterOrEqualThan(7.0)) {
        //        #ifdef __IPHONE_7_0
        CGRect textRect = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:self.font} context:nil];
        //        return ceil(textRect.size.height);
        return textRect.size.height;
        //        #else
        //        return self.fr
        //        #endif
    } else {
        CGSize size = [self.text sizeWithFont:self.font
                         constrainedToSize   :CGSizeMake(self.frame.size.width, MAXFLOAT)
                         lineBreakMode       :NSLineBreakByWordWrapping];
        return size.height;
    }
}

- (CGFloat)ez_textWidth
{
    if (self.text.length == 0) {
        return 0.f;
    }
    
    if (SystemVersionGreaterOrEqualThan(7.0)) {
        CGRect textRect = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.frame.size.height) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:self.font} context:nil];
        return textRect.size.width;
    } else {
        CGSize size = [self.text sizeWithFont:self.font
                         constrainedToSize   :CGSizeMake(MAXFLOAT, self.frame.size.height)
                         lineBreakMode       :NSLineBreakByWordWrapping];
        
        return size.width;
    }
}

- (void)ez_fixHeight
{
    [self ez_fixHeightWithMaxNumberLine:0];
}

- (void)ez_fixHeightWithText:(NSString *)text
{
    [self ez_fixHeighthWithMaxNumberLine:0 withText:text];
}

- (void)ez_fixHeightWithMaxNumberLine:(NSUInteger)maxNumberLine
{
    UIFont *font = self.font;
    //    CGSize  storyTextSize = [self.text sizeWithFont:font constrainedToSize:CGSizeMake(self.frame.size.width, MAXFLOAT)
    //        lineBreakMode:NSLineBreakByWordWrapping];
    float height = [self ez_textHeight];
    
    self.numberOfLines = ceilf(height / font.lineHeight);
    
    if ((maxNumberLine > 0) && (self.numberOfLines > maxNumberLine)) {
        height = font.lineHeight * maxNumberLine;
        self.numberOfLines = maxNumberLine;
    }
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
}

- (void)ez_fixHeighthWithMaxNumberLine:(NSUInteger)maxNumberLine withText:(NSString *)text
{
    self.text = text;
    [self ez_fixHeightWithMaxNumberLine:maxNumberLine];
}
@end
