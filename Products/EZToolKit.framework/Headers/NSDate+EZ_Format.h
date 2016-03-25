//
//  NSDate+EZ_Format.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (EZ_Format)
- (NSString *)ez_dateToDateStringWithDateFormat:(NSString *)formatString
                                    timezone:(NSString *)timezoneAbbr
                                      locale:(NSString *)localeIdentifier;

- (NSString *)ez_dateToDateStringWithDateFormat:(NSString *)formatString
                              customTimezone:(NSTimeZone *)timezone
                                      locale:(NSString *)localeIdentifier;
@end
