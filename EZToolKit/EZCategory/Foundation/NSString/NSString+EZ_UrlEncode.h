//
//  NSString+EZ_UrlEncode.h
//  EZToolKit
//
//  Created by neu on 16/4/25.
//  Copyright © 2016年 Cactus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (EZ_UrlEncode)
/**
 *  @brief  urlEncode
 *
 *  @return urlEncode 后的字符串
 */
- (NSString *)ez_urlEncode;
/**
 *  @brief  urlEncode
 *
 *  @param encoding encoding模式
 *
 *  @return urlEncode 后的字符串
 */
- (NSString *)ez_urlEncodeUsingEncoding:(NSStringEncoding)encoding;
/**
 *  @brief  urlDecode
 *
 *  @return urlDecode 后的字符串
 */
- (NSString *)ez_urlDecode;
/**
 *  @brief  urlDecode
 *
 *  @param encoding encoding模式
 *
 *  @return urlDecode 后的字符串
 */
- (NSString *)ez_urlDecodeUsingEncoding:(NSStringEncoding)encoding;

/**
 *  @brief  url query转成NSDictionary
 *
 *  @return NSDictionary
 */
- (NSDictionary *)ez_dictionaryFromURLParameters;
@end
