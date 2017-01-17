//
//  UUID.m
//  KeyChina
//
//  Created by QAING CHEN on 17/1/17.
//  Copyright © 2017年 QiangChen. All rights reserved.
//

#import "UUID.h"
#import "KeyChinaStore.h"

#define  KEY_USERNAME_PASSWORD @"com.company.app.usernamepassword"

#define  KEY_USERNAME @"com.company.app.username"

#define  KEY_PASSWORD @"com.company.app.password"

@implementation UUID

+ (NSString *)getUUID
{
    NSString *strUUID = (NSString *)[KeyChinaStore load:@"com.company.app.usernamepassword"];;
    //首次执行该方法时,uuid为空
    if ([strUUID isEqualToString:@""] || !strUUID){
    
        //生成一个uuid的方法
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuidRef));
    
    //将该uuid保存到keyChina
    [KeyChinaStore save:KEY_USERNAME_PASSWORD data:strUUID];
}

    return strUUID;
}
@end
