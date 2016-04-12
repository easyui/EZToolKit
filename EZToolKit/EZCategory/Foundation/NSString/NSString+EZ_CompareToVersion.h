//
//  NSString+EZ_CompareToVersion.h
//  EZToolKit
//
//  Created by yangjun zhu on 16/4/12.
//  Copyright © 2016年 Cactus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (EZ_CompareToVersion)
- (NSComparisonResult)ez_compareToVersion:(NSString *)version;

- (BOOL)ez_isOlderThanVersion:(NSString *)version;
- (BOOL)ez_isNewerThanVersion:(NSString *)version;
- (BOOL)ez_isEqualToVersion:(NSString *)version;
- (BOOL)ez_isEqualOrOlderThanVersion:(NSString *)version;
- (BOOL)ez_isEqualOrNewerThanVersion:(NSString *)version;

- (NSString *)ez_appURLStringWithAppID:(NSString *)appID;
@end
