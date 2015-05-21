//
//  NSObject+EZ_Association.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (EZ_Association)
- (id)ez_associatedObjectForKey:(NSString*)key;
- (void)ez_setAssociatedObject:(id)object forKey:(NSString*)key;
@end
