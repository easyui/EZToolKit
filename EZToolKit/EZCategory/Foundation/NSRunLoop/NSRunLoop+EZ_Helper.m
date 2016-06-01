//
//  NSRunLoop+EZ_Helper.m
//  EZToolKit
//
//  Created by neu on 16/5/31.
//  Copyright © 2016年 Cactus. All rights reserved.
//

#import "NSRunLoop+EZ_Helper.h"
NSString *const EZ_NSRunloopTimeoutException = @"EZ_NSRunloopTimeoutException";

@implementation NSRunLoop (EZ_Helper)
- (void)ez_performBlockAndWait:(void (^)(BOOL *))block
{
    [self ez_performBlockAndWait:block timeoutInterval:10.0];
}

- (void)ez_performBlockAndWait:(void (^)(BOOL *))block timeoutInterval:(NSTimeInterval)timeoutInterval
{
    if (!block || timeoutInterval < 0.0) {
        [NSException raise:NSInvalidArgumentException format:@"%lf is invalid for timeout interval", timeoutInterval];
    }
    
    NSDate *startedDate = [NSDate date];
    BOOL finish = NO;
    
    block(&finish);
    
    while (!finish && [[NSDate date] timeIntervalSinceDate:startedDate] < timeoutInterval) {
        @autoreleasepool {
            [self runUntilDate:[NSDate dateWithTimeIntervalSinceNow:.1]];
        }
    }
    
    if (!finish) {
        [NSException raise:EZ_NSRunloopTimeoutException format:@"execution of block timed out in performBlockAndWait:."];
    }
}
@end
