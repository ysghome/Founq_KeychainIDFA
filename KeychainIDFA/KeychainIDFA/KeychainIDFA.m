//
//  KeychainIDFA.m
//  KeychainIDFA
//
//  Created by Qixin on 14/12/18.
//  Copyright (c) 2014年 Qixin. All rights reserved.
//

#import "KeychainIDFA.h"
#import "KeychainHelper.h"
@import AdSupport;

#define kIsStringValid(text) (text && text != NULL && text.length > 0)

//设置你idfa的Keychain标示,该标示相当于key,而你的IDFA是value(默认为项目Identifier，所以 当项目的标识更改后也会不能获取，会重新创建)
#define IDFA_STRING [[NSBundle mainBundle] bundleIdentifier] ? [[NSBundle mainBundle] bundleIdentifier] : @"com.fangqu.idfa"

@implementation KeychainIDFA

+ (void)deleteIDFA {
    [KeychainHelper delete:IDFA_STRING];
}

+ (NSString *)IDFA {
    // 0.读取keychain的缓存
    NSString *deviceID = [KeychainIDFA getIdfaString];
    if (kIsStringValid(deviceID)) {
        return deviceID;
    } else {
        // 1.取IDFA,可能会取不到,如用户关闭IDFA
        if ([ASIdentifierManager sharedManager].advertisingTrackingEnabled) {
            deviceID = [[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString] lowercaseString];
            [KeychainIDFA setIdfaString:deviceID];
            return deviceID;
        } else {
            // 2.如果取不到,就生成UUID,当成IDFA
            deviceID = [KeychainIDFA getUUID];
            [KeychainIDFA setIdfaString:deviceID];
            if (kIsStringValid(deviceID)) {
                return deviceID;
            }
        }
    }
    return nil;
}

#pragma mark - Keychain
+ (NSString *)getIdfaString {
    NSString *idfaStr = [KeychainHelper load:IDFA_STRING];
    if (kIsStringValid(idfaStr)) {
        return idfaStr;
    } else {
        return nil;
    }
}

+ (BOOL)setIdfaString:(NSString *)secValue {
    if (kIsStringValid(secValue)) {
        [KeychainHelper save:IDFA_STRING data:secValue];
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - UUID
+ (NSString *)getUUID {
    CFUUIDRef uuid_ref = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef uuid_string_ref = CFUUIDCreateString(kCFAllocatorDefault, uuid_ref);

    CFRelease(uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString *) uuid_string_ref];
    if (!kIsStringValid(uuid)) {
        uuid = @"";
    }
    CFRelease(uuid_string_ref);
    return [uuid lowercaseString];
}

@end
