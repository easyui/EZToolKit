//
//  NSObject+EZ_AutoCoding.m
//  EZToolKit
//
//  Created by mikeymonster on 15/10/14.
//  Copyright © 2015年 Cactus. All rights reserved.
//

#import "NSObject+EZ_AutoCoding.h"
#include <objc/runtime.h>
#include <objc/objc-auto.h>

@implementation NSObject (EZ_AutoCoding)

//- (void)encodeWithCoder:(NSCoder *)encoder {
//    Class cls = [self class];
//    while (cls != [NSObject class]) {
//        unsigned int numberOfIvars = 0;
//        Ivar* ivars = class_copyIvarList(cls, &numberOfIvars);
//        for(const Ivar* p = ivars; p < ivars+numberOfIvars; p++)
//        {
//            Ivar const ivar = *p;
//            const char *type = ivar_getTypeEncoding(ivar);
//            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
//            id value = [self valueForKey:key];
//            if (value) {
//                switch (type[0]) {
//                    case _C_STRUCT_B: {
//                        NSUInteger ivarSize = 0;
//                        NSUInteger ivarAlignment = 0;
//                        NSGetSizeAndAlignment(type, &ivarSize, &ivarAlignment);
//                        const char * bytes = CFBridgingRetain(self);
//                        NSData *data = [NSData dataWithBytes:bytes + ivar_getOffset(ivar)
//                                                      length:ivarSize];
//                        CFRelease((__bridge CFTypeRef)(self));
//                        [encoder encodeObject:data forKey:key];
//                    }
//                        break;
//                    default:
//                        [encoder encodeObject:value
//                                       forKey:key];
//                        break;
//                }
//            }
//        }
//        cls = class_getSuperclass(cls);
//        free(ivars);
//    }
//}
//
//- (id)initWithCoder:(NSCoder *)decoder {
//    // because NSObject dose not have 'super', use 'self' instead.
//    // if u have better solutions, please contact me.
//    self = [self init];
//    
//    if (self) {
//        Class cls = [self class];
//        while (cls != [NSObject
//                       class]) {
//            unsigned int numberOfIvars = 0;
//            Ivar* ivars = class_copyIvarList(cls, &numberOfIvars);
//            
//            for(const Ivar* p = ivars; p < ivars+numberOfIvars; p++)
//            {
//                Ivar const ivar = *p;
//                const char *type = ivar_getTypeEncoding(ivar);
//                NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
//                id value = [decoder decodeObjectForKey:key];
//                if (value) {
//                    switch (type[0]) {
//                        case _C_STRUCT_B: {
//                            NSUInteger ivarSize = 0;
//                            NSUInteger ivarAlignment = 0;
//                            NSGetSizeAndAlignment(type, &ivarSize, &ivarAlignment);
//                            NSData *data = [decoder decodeObjectForKey:key];
//                            
//                            char * bytes = (char *)CFBridgingRetain(self);
//                            char *sourceIvarLocation = bytes+ ivar_getOffset(ivar);
//                            CFRelease((__bridge CFTypeRef)(self));
//                            [data getBytes:sourceIvarLocation length:ivarSize];
//                            // I get a wierd problem in 10.1, after I retrieved bytes from data,
//                            // the struct size did have value here. But when the object is 
//                            // returned, I logged the size of the object, it's (0, 0).
//                            // If I added the memcpy function, it worked well, I did got the size(50, 30).
//                            // But now I removed the memcpy, it worked too.
//                            // I don't konw what happens here.
//                            //							memcpy((char *)self + ivar_getOffset(ivar), sourceIvarLocation, ivarSize);
//                        }
//                            break;
//                        default:
//                            [self setValue:[decoder decodeObjectForKey:key]
//                                    forKey:key];
//                            break;
//                    }
//                }			
//            }
//            cls = class_getSuperclass(cls);
//            free(ivars);
//        }
//    }
//    
//    return self;
//}

- (NSDictionary *)ez_toDictionary{
    
    @try {
        NSDictionary *dic = nil;
        unsigned int outCount, i;
        Class class = [self class];
        NSMutableArray *tmpKeys = [[NSMutableArray alloc] init];
        do{
            objc_property_t *properties = class_copyPropertyList(class, &outCount);
            for(i = 0; i < outCount; i++) {
                objc_property_t property = properties[i];
                NSString *key=[[NSString alloc]initWithCString:property_getName(property)encoding:NSUTF8StringEncoding];
                [tmpKeys addObject:key];
            }
            class = [class superclass];
        } while (class != [NSObject class]);
        
        dic = [self dictionaryWithValuesForKeys:tmpKeys];
        return dic;
        
    }
    @catch (NSException *exception) {
        NSLog(@"Warning: %@ Class dictionary exception: %@",[self class],[exception debugDescription]);
        
    }
    
}
@end
