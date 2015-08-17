//
//  NSURL+EZ_Helper.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/6/9.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//



@interface NSURL (EZ_Helper)
- (NSDictionary *)ez_parameters;
- (NSString *)ez_valueForParameter:(NSString *)parameterKey;
@end
