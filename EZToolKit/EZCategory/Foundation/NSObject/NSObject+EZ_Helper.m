//
//  NSObject+EZ_Helper.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/6/10.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import "NSObject+EZ_Helper.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@implementation NSObject (EZ_Helper)
- (id)ez_performSelector:(SEL)aSelector withObject:(NSArray *)objects{
    NSInvocation *invocation;
    NSMethodSignature *methodSignature;
    methodSignature = [self methodSignatureForSelector:aSelector];
    NSCAssert(methodSignature, @"unrecognized selector %@ for instance %@", NSStringFromSelector(aSelector), self);
    invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    [invocation setTarget:self];
    [invocation setSelector:aSelector];
    
    NSUInteger numberOfArguments = methodSignature.numberOfArguments;
    for (NSUInteger i = 2; i < numberOfArguments; i++) {
        const char *argumentType = [methodSignature getArgumentTypeAtIndex:i];
        id valObj = objects[i-2];
        switch (argumentType[0]) {
                
#define EZ_CALL_ARG_CASE(_typeString, _type, _selector) \
case _typeString: {                              \
_type value = [valObj _selector];                     \
[invocation setArgument:&value atIndex:i];\
break; \
}
                
                EZ_CALL_ARG_CASE('c', char, charValue)
                EZ_CALL_ARG_CASE('C', unsigned char, unsignedCharValue)
                EZ_CALL_ARG_CASE('s', short, shortValue)
                EZ_CALL_ARG_CASE('S', unsigned short, unsignedShortValue)
                EZ_CALL_ARG_CASE('i', int, intValue)
                EZ_CALL_ARG_CASE('I', unsigned int, unsignedIntValue)
                EZ_CALL_ARG_CASE('l', long, longValue)
                EZ_CALL_ARG_CASE('L', unsigned long, unsignedLongValue)
                EZ_CALL_ARG_CASE('q', long long, longLongValue)
                EZ_CALL_ARG_CASE('Q', unsigned long long, unsignedLongLongValue)
                EZ_CALL_ARG_CASE('f', float, floatValue)
                EZ_CALL_ARG_CASE('d', double, doubleValue)
                EZ_CALL_ARG_CASE('B', BOOL, boolValue)
                
            case ':': {
                SEL value = NSSelectorFromString(valObj);
                [invocation setArgument:&value atIndex:i];
                break;
            }
            case '{': {
                NSString *typeString = [NSString stringWithUTF8String:argumentType];
#define EZ_CALL_ARG_STRUCT(_type, _transFunc) \
if ([typeString rangeOfString:@#_type].location != NSNotFound) {    \
_type value = _transFunc(valObj);  \
[invocation setArgument:&value atIndex:i];  \
break; \
}
                EZ_CALL_ARG_STRUCT(CGRect, __ez_dictToRect)
                EZ_CALL_ARG_STRUCT(CGPoint, __ez_dictToPoint)
                EZ_CALL_ARG_STRUCT(CGSize, __ez_dictToSize)
                EZ_CALL_ARG_STRUCT(NSRange, __ez_dictToRange)
                
                break;
            }
            default: {
                static const char *blockType = @encode(typeof(^{}));
                if (!strcmp(argumentType, blockType)) {
                    __autoreleasing id cb = valObj;//需要做些转换;
                    [invocation setArgument:&cb atIndex:i];
                } else {
                    [invocation setArgument:&valObj atIndex:i];
                }
            }
        }
    }
    
    [invocation invoke];
    const char *returnType = [methodSignature methodReturnType];
    id returnValue;
    if (strncmp(returnType, "v", 1) != 0) {
        if (strncmp(returnType, "@", 1) == 0) {
            id __unsafe_unretained tempResultSet;
            [invocation getReturnValue:&tempResultSet];
            returnValue = tempResultSet;
            
            return returnValue;
            
        } else {
            switch (returnType[0]) {
                    
#define EZ_CALL_RET_CASE(_typeString, _type) \
case _typeString: {                              \
_type tempResultSet; \
[invocation getReturnValue:&tempResultSet];\
returnValue = @(tempResultSet); \
break; \
}
                    
                    EZ_CALL_RET_CASE('c', char)
                    EZ_CALL_RET_CASE('C', unsigned char)
                    EZ_CALL_RET_CASE('s', short)
                    EZ_CALL_RET_CASE('S', unsigned short)
                    EZ_CALL_RET_CASE('i', int)
                    EZ_CALL_RET_CASE('I', unsigned int)
                    EZ_CALL_RET_CASE('l', long)
                    EZ_CALL_RET_CASE('L', unsigned long)
                    EZ_CALL_RET_CASE('q', long long)
                    EZ_CALL_RET_CASE('Q', unsigned long long)
                    EZ_CALL_RET_CASE('f', float)
                    EZ_CALL_RET_CASE('d', double)
                    EZ_CALL_RET_CASE('B', BOOL)
                    
                case '{': {
                    NSString *typeString = [NSString stringWithUTF8String:returnType];
#define EZ_CALL_RET_STRUCT(_type, _transFunc) \
if ([typeString rangeOfString:@#_type].location != NSNotFound) {    \
_type result;   \
[invocation getReturnValue:&result];    \
return _transFunc(result);    \
}
                    EZ_CALL_RET_STRUCT(CGRect, __ez_rectToDictionary)
                    EZ_CALL_RET_STRUCT(CGPoint, __ez_pointToDictionary)
                    EZ_CALL_RET_STRUCT(CGSize, __ez_sizeToDictionary)
                    EZ_CALL_RET_STRUCT(NSRange, __ez_rangeToDictionary)
                }
                    break;
            }
            return returnValue;
        }
    }
    return nil;
}


static CGRect __ez_dictToRect(NSDictionary *dict)
{
    return CGRectMake([dict[@"x"] intValue], [dict[@"y"] intValue], [dict[@"width"] intValue], [dict[@"height"] intValue]);
}

static CGPoint __ez_dictToPoint(NSDictionary *dict)
{
    return CGPointMake([dict[@"x"] intValue], [dict[@"y"] intValue]);
}

static CGSize __ez_dictToSize(NSDictionary *dict)
{
    return CGSizeMake([dict[@"width"] intValue], [dict[@"height"] intValue]);
}

static NSRange __ez_dictToRange(NSDictionary *dict)
{
    return NSMakeRange([dict[@"location"] intValue], [dict[@"length"] intValue]);
}


static NSDictionary *__ez_rectToDictionary(CGRect rect)
{
    return @{@"x": @(rect.origin.x), @"y": @(rect.origin.y), @"width": @(rect.size.width), @"height": @(rect.size.height)};
}

static NSDictionary *__ez_pointToDictionary(CGPoint point)
{
    return @{@"x": @(point.x), @"y": @(point.y)};
}

static NSDictionary *__ez_sizeToDictionary(CGSize size)
{
    return @{@"width": @(size.width), @"height": @(size.height)};
}

static NSDictionary *__ez_rangeToDictionary(NSRange range)
{
    return @{@"location": @(range.location), @"length": @(range.length)};
}


- (NSUInteger)ez_retainCount {
    return [[self valueForKey:@"retainCount"] unsignedLongValue];
}


EZWeakReference ez_makeWeakReference(id object){
    __weak id weakref = object;
    return ^{
        return weakref;
    };
}

id ez_weakReferenceNonretainedObjectValue(EZWeakReference ref){
    return ref ? ref() : nil;

}


-(NSString *)nameTag{
    return objc_getAssociatedObject(self, @selector(nameTag));
}

-(void)setNameTag:(NSString *)nameTag{
    objc_setAssociatedObject(self, @selector(nameTag), nameTag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}
@end
