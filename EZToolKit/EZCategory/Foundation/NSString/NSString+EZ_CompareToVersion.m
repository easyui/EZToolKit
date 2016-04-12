//
//  NSString+EZ_CompareToVersion.m
//  EZToolKit
//
//  Created by yangjun zhu on 16/4/12.
//  Copyright © 2016年 Cactus. All rights reserved.
//

#import "NSString+EZ_CompareToVersion.h"

@implementation NSString (EZ_CompareToVersion)

- (NSComparisonResult)ez_compareToVersion:(NSString *)version{
    NSComparisonResult result;
    
    result = NSOrderedSame;
    
    if(![self isEqualToString:version]){
        NSArray *thisVersion = [self componentsSeparatedByString:@"."];
        NSArray *compareVersion = [version componentsSeparatedByString:@"."];
        
        NSInteger thisVersionCount = [thisVersion count];
        NSInteger compareVersionCount = [compareVersion count];
        NSInteger maxCount = MAX([thisVersion count], [compareVersion count]);
        
        for(NSInteger index = 0; index < maxCount; index++){
            NSInteger thisSegment = (index < thisVersionCount) ? [[thisVersion objectAtIndex:index] integerValue] : 0;
            NSInteger compareSegment = (index < compareVersionCount) ? [[compareVersion objectAtIndex:index] integerValue] : 0;
            
            if(thisSegment < compareSegment){
                result = NSOrderedAscending;
                break;
            }
            
            if(thisSegment > compareSegment){
                result = NSOrderedDescending;
                break;
            }
        }
    }
    
    return result;
}


- (BOOL)ez_isOlderThanVersion:(NSString *)version{
    return ([self ez_compareToVersion:version] == NSOrderedAscending);
}

- (BOOL)ez_isNewerThanVersion:(NSString *)version{
    return ([self ez_compareToVersion:version] == NSOrderedDescending);
}

- (BOOL)ez_isEqualToVersion:(NSString *)version{
    return ([self ez_compareToVersion:version] == NSOrderedSame);
}

- (BOOL)ez_isEqualOrOlderThanVersion:(NSString *)version{
    return ([self ez_compareToVersion:version] != NSOrderedDescending);
}

- (BOOL)ez_isEqualOrNewerThanVersion:(NSString *)version{
    return ([self ez_compareToVersion:version] != NSOrderedAscending);
}


@end
