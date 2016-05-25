
//
//  Person.m
//  RuntimeDemo
//
//  Created by wengzilin on 15/10/12.
//  Copyright (c) 2015年 wengzilin. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
#import "EZSerializeMacro.h"

//是否使用通用的encode/decode代码一次性encode/decode
#define USING_ENCODE_KIT            1

@implementation Person

EZSERIALIZE_CODER_DECODER();

EZSERIALIZE_COPY_WITH_ZONE();

EZSERIALIZE_DESCRIPTION();
@end
