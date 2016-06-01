//
//  NSRunLoop+EZ_Helper.h
//  EZToolKit
//
//  Created by neu on 16/5/31.
//  Copyright © 2016年 Cactus. All rights reserved.
//  https://github.com/ishkawa/NSRunLoop-PerformBlock

#import <Foundation/Foundation.h>
/* 使用
 - (void)testPerformBlockAndWait
 {
 // 1
 __block BOOL flag = NO;
 
 [[NSRunLoop currentRunLoop] performBlockAndWait:^(BOOL *finish) {
 double delayInSeconds = 2.0;
 dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
 dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
 dispatch_after(popTime, queue, ^(void){
 // 2
 flag = YES;
 *finish = YES;
 });
 }];
 
 // 3
 XCTAssertTrue(flag);
 }
 */

extern NSString *const EZ_NSRunloopTimeoutException;

@interface NSRunLoop (EZ_Helper)
/**
 *  @author ishkawa
 *
 *  @brief   extension of NSRunLoop for waiting.
 *
 *  @param block <#block description#>
 */
- (void)ez_performBlockAndWait:(void (^)(BOOL *finish))block;
/**
 *  @author ishkawa
 *
 *  @brief   extension of NSRunLoop for waiting.
 *
 *  @param block <#block description#>
 */
- (void)ez_performBlockAndWait:(void (^)(BOOL *finish))block timeoutInterval:(NSTimeInterval)timeoutInterval;
@end
