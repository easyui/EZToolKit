//
//  NSBundle+EZ_AppIcon.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/6/9.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import "NSBundle+EZ_AppIcon.h"

@implementation NSBundle (EZ_AppIcon)
- (NSString*)ez_appIconPath {
    NSString* iconFilename = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIconFile"] ;
    NSString* iconBasename = [iconFilename stringByDeletingPathExtension] ;
    NSString* iconExtension = [iconFilename pathExtension] ;
    return [[NSBundle mainBundle] pathForResource:iconBasename
                                           ofType:iconExtension] ;
}

- (UIImage*)ez_appIcon {
    UIImage*appIcon = [[UIImage alloc] initWithContentsOfFile:[self ez_appIconPath]] ;
    return appIcon;
}
@end
