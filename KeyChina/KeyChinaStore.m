//
//  KeyChinaStore.m
//  KeyChina
//
//  Created by QAING CHEN on 17/1/17.
//  Copyright © 2017年 QiangChen. All rights reserved.
//

#import "KeyChinaStore.h"

@implementation KeyChinaStore

+ (NSMutableDictionary *)getKeyChinaQuery:(NSString *)service
{
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:(id)kSecClassGenericPassword,(id)kSecClass,service,(id)kSecAttrServer,service,(id)kSecAttrAccount,(id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible, nil];
    
}

+ (void)save:(NSString *)service data:(id)data
{
    //get search dictionry
    NSMutableDictionary *keyChinaQuery = [self getKeyChinaQuery:service];
    
    //delegate old item before add new item
    SecItemDelete((CFDictionaryRef)keyChinaQuery);
    
    //add new object to searchdicttionary(archivedDataWithrootObject:data)
    [keyChinaQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    
    //add item to keyChina with the search dictionary
    SecItemAdd((CFDictionaryRef)keyChinaQuery, NULL);
}

+ (id)load:(NSString *)service
{
    id ret = nil;
    NSMutableDictionary *keychinaQuery = [self getKeyChinaQuery:service];
    //Configure the search setting
    
    //Since in our simple case we are expecting only a single attribute to be returned (the password) we can set the attribute kSecReturnData to kCFBooleanTrue
    [keychinaQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecValueData];
    [keychinaQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    
    if (SecItemCopyMatching((CFDictionaryRef)keychinaQuery,(CFTypeRef *)&keyData) == noErr) {
        @try {
          ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        } @finally {
            
        }
        
    }
    
    if (keyData)
        CFRelease(keyData);
        return ret;
}


+ (void)deleteKeyData:(NSString *)service
{
    NSMutableDictionary *keyChinaQuery = [self getKeyChinaQuery:service];
    SecItemDelete((CFDictionaryRef)keyChinaQuery);
}






@end
