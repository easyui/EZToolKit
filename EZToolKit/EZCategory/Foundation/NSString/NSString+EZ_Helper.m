//
//  NSString+EZ_Helper.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import "NSString+EZ_Helper.h"

@implementation NSString (EZ_Helper)
- (NSString *)ez_reverse
{
    NSMutableString *reversedString = [NSMutableString stringWithCapacity:[self length]];
    
    for (NSInteger i = ([self length] - 1); i >= 0; i -= 1) {
        [reversedString appendString:[NSString stringWithFormat:@"%C", [self characterAtIndex:i]]];
    }
    
    return reversedString;
}

- (NSString *)ez_substringAtIndex:(NSUInteger)index
{
    if (index > self.length) {
        return nil;
    }
    
    return [NSString stringWithFormat:@"%c", [self characterAtIndex:index]];
}

- (BOOL)ez_hasSubstring:(NSString *)sub
{
    NSRange range = [self rangeOfString:sub];
    
    if ((range.location == NSNotFound) && (range.length == 0)) {
        return NO;
    }
    
    return YES;
}


- (NSString *)ez_stringByTrim{
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

@end
