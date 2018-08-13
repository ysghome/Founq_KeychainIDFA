//
//  KeychainIDFA.h
//  KeychainIDFA
//
//  Created by Qixin on 14/12/18.
//  Copyright (c) 2014年 Qixin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeychainIDFA : NSObject

//获取IDFA
+ (NSString *)IDFA;

//删除keychain的IDFA(一般不需要)
+ (void)deleteIDFA;

@end
