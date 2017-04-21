//
//  NSString+EZ_Helper.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (EZ_Helper)
- (NSString *)ez_reverse;
- (NSString *)ez_substringAtIndex:(NSUInteger)index;
- (BOOL)ez_hasSubstring:(NSString*)sub;

- (NSString *)ez_stringByTrimWhitespace;//去掉前后空格
- (NSString *)ez_stringByTrimWhitespaceAndNewlines;//去掉前后空格和空行


/**
 *  @brief  获取随机 UUID 例如 E621E1F8-C36C-495A-93FC-0C247A3E6E5F
 *   Universally Unique Identifier,翻译过来就是通用唯一标识符。是一个32位的十六进制序列
 *  @return 随机 UUID
 */
+ (NSString *)ez_UUID;
/**
 *
 *  @brief  毫秒时间戳 例如 1443066826371
 *
 *  @return 毫秒时间戳
 */
+ (NSString *)ez_UUIDTimestamp;

/**
 Vindor标示符 (IDFV-identifierForVendor):这种叫法也是在iOS 6中新增的，不过获取这个IDFV的新方法被添加在已有的UIDevice类中。跟advertisingIdentifier一样，该方法返回的是一个NSUUID对象。如果满足这样的条件，那么获取到的这个属性值就不会变：相同的一个程序里面-相同的vindor-相同的设备。如果是这样的情况，那么这个值是不会相同的：相同的程序-相同的设备-不同的vindor，或者是相同的程序-不同的设备-无论是否相同的vindor。
 
 看完上面的内容，我有这样的一个疑问“vendor是什么”。我首先想到的是苹果开发者账号。但事实证明这是错误的。接着我想可能是有一个AppIdentifierPrefix东西，跟钥匙串访问一样，可以在多个程序间共享。同样，这个想法也是的。最后证明，vendor非常简单：一个Vendor是CFBundleIdentifier（反转DNS格式）的前两部分。例如，com.doubleencore.app1 和 com.doubleencore.app2 得到的identifierForVendor是相同的，因为它们的CFBundleIdentifier 前两部分是相同的。不过这样获得的identifierForVendor则完全不同：com.massivelyoverrated 或 net.doubleencore。
 
 在这里，还需要注意的一点就是：如果用户卸载了同一个vendor对应的所有程序，然后在重新安装同一个vendor提供的程序，此时identifierForVendor会被重置。

 @return  示例: 599F9C00-92DC-4B5C-9464-7971F01F8370
 */
+ (NSString *)ez_IDFV;

/**
 广告标示符（IDFA-identifierForIdentifier）:广告标示符是由系统存储着的。不过即使这是由系统存储的，但是有几种情况下，会重新生成广告标示符。如果用户完全重置系统（(设置程序 -> 通用 -> 还原 -> 还原位置与隐私) ，这个广告标示符会重新生成。另外如果用户明确的还原广告(设置程序-> 通用 -> 关于本机 -> 广告 -> 还原广告标示符) ，那么广告标示符也会重新生成。关于广告标示符的还原，有一点需要注意：如果程序在后台运行，此时用户“还原广告标示符”，然后再回到程序中，此时获取广告标示符并不会立即获得还原后的标示符。必须要终止程序，然后再重新启动程序，才能获得还原后的广告标示符。之所以会这样，我猜测是由于ASIdentifierManager是一个单例。针对广告标示符用户有一个可控的开关“限制广告跟踪”。Nick Arnott的文章中已经指出了。将这个开关打开，实际上什么也没有做，不过这是希望限制你访问广告标示符。这个开关是一个简单的boolean标志，当将广告标示符发到任意的服务器端时，你最好判断一下这个值，然后再做决定。

 @return 示例: 1E2DFA89-496A-47FD-9941-DF1FC4E6484A
 */
+ (NSString *)ez_IDFA;
@end
NS_ASSUME_NONNULL_END
