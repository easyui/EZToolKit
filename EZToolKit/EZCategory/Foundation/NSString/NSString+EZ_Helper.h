//
//  NSString+EZ_Helper.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (EZ_Helper)
- (NSString *)ez_reverse;
- (NSString *)ez_substringAtIndex:(NSUInteger)index;
- (BOOL)ez_hasSubstring:(NSString*)sub;

- (NSString *)ez_stringByTrim;//去掉前后空格
@end
NS_ASSUME_NONNULL_END
