//
//  KeyChinaStore.h
//  KeyChina
//
//  Created by QAING CHEN on 17/1/17.
//  Copyright © 2017年 QiangChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChinaStore : NSObject
+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)deleteKeyData:(NSString *)service;

@end
