//
//  NSString+EZ_Format.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (EZ_Format)
- (NSString *)ez_dateStringToDateStringWithDateFormat:(NSString *)formatString
                                          timezone:(NSString *)timezoneAbbr
                                            locale:(NSString *)localeIdentifier
                                      toDateFormat:(NSString *)toFormatString
                                        toTimezone:(NSString *)toTimezoneAbbr
                                          toLocale:(NSString *)toLocaleIdentifier;


- (NSString *)ez_dateStringToDateStringWithDateFormat:(NSString *)formatString
                                    customTimezone:(NSTimeZone *)timezone
                                            locale:(NSString *)localeIdentifier
                                      toDateFormat:(NSString *)toFormatString
                                  toCustomTimezone:(NSTimeZone *)toTimezone
                                          toLocale:(NSString *)toLocaleIdentifier;
@end
