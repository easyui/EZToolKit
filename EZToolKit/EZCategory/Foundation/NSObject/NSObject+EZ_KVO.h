//
//  NSObject+EZ_KVO.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/9/14.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

/*
 感谢：https://github.com/okcomp/ImplementKVO
 */
#import <Foundation/Foundation.h>
typedef void(^EZObservingBlock)(id observedObject, NSString *observedKey, id oldValue, id newValue);


@interface NSObject (EZ_KVO)

- (void)ez_addObserver:(NSObject *)observer
                forKey:(NSString *)key
             withBlock:(EZObservingBlock)block;

- (void)ez_removeObserver:(NSObject *)observer forKey:(NSString *)key;
@end
