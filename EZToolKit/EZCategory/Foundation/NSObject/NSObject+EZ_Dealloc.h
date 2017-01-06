//
//  NSObject+EZ_Dealloc.h
//  EZToolKit
//
//  Created by yangjun zhu on 2017/1/6.
//  Copyright © 2017年 Cactus. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^voidBlock)(void);

@interface EZBlockExecutor : NSObject

- (id)initWithBlock:(voidBlock)block;

@end
@interface NSObject (EZ_Dealloc)
- (void)ez_runAtDealloc:(voidBlock)block;

@end
