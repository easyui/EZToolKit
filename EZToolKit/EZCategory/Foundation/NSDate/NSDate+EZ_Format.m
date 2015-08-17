//
//  NSDate+EZ_Format.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import "NSDate+EZ_Format.h"

@implementation NSDate (EZ_Format)
- (NSString *)ez_dateToDateStringWithDateFormat:(NSString *)formatString
                                    timezone:(NSString *)timezoneAbbr
                                      locale:(NSString *)localeIdentifier
{
    return [self ez_dateToDateStringWithDateFormat:formatString customTimezone:[NSTimeZone timeZoneWithAbbreviation:timezoneAbbr] locale:localeIdentifier];
}



- (NSString *)ez_dateToDateStringWithDateFormat:(NSString *)formatString
                              customTimezone:(NSTimeZone *)timezone
                                      locale:(NSString *)localeIdentifier
{
    NSDateFormatter * dateFormat = [[NSDateFormatter alloc] init];
    
    [dateFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:localeIdentifier]];
    [dateFormat setTimeZone:timezone];
    
    [dateFormat setDateFormat:formatString];
    return [dateFormat stringFromDate:self];
}
@end
