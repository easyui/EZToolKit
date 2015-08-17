//
//  NSString+EZ_Format.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import "NSString+EZ_Format.h"

@implementation NSString (EZ_Format)
- (NSString *)  ez_dateStringToDateStringWithDateFormat:(NSString *)formatString
                timezone                            :(NSString *)timezoneAbbr
                locale                              :(NSString *)localeIdentifier
                toDateFormat                        :(NSString *)toFormatString
                toTimezone                          :(NSString *)toTimezoneAbbr
                toLocale                            :(NSString *)toLocaleIdentifier
{
    return [self ez_dateStringToDateStringWithDateFormat:formatString customTimezone:[NSTimeZone timeZoneWithAbbreviation:timezoneAbbr] locale:localeIdentifier toDateFormat:toFormatString toCustomTimezone:[NSTimeZone timeZoneWithAbbreviation:toTimezoneAbbr] toLocale:toLocaleIdentifier];
}

- (NSString *)  ez_dateStringToDateStringWithDateFormat:(NSString *)formatString
                customTimezone                      :(NSTimeZone *)timezone
                locale                              :(NSString *)localeIdentifier
                toDateFormat                        :(NSString *)toFormatString
                toCustomTimezone                    :(NSTimeZone *)toTimezone
                toLocale                            :(NSString *)toLocaleIdentifier
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    [dateFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:localeIdentifier]];
    [dateFormat setTimeZone:timezone];
    
    [dateFormat setDateFormat:formatString];
    NSDate *date = [dateFormat dateFromString:self];
    
    [dateFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:toLocaleIdentifier]];
    [dateFormat setTimeZone:toTimezone];
    
    [dateFormat setDateFormat:toFormatString];
    return [dateFormat stringFromDate:date];
}
@end
