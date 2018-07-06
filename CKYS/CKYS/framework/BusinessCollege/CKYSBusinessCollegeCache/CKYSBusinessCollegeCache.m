//
//  CKYSBusinessCollegeCache.m
//  CKYS
//
//  Created by Yan on 2018/7/5.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSBusinessCollegeCache.h"
#import "CKYSBusinessCollegeItem.h"
#import "MJExtension.h"

@implementation CKYSBusinessCollegeCache {
    NSString *_fileName;
    NSString *_filePath;
}

#define CKYS_BC_CACHE_CONST  @"ckysBusinessCollegeCache"

- (instancetype)init {
    self = [super init];
    if (self) {
        _fileName = CKYS_BC_CACHE_CONST;
        NSString *businessCollegeCachePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        businessCollegeCachePath = [businessCollegeCachePath stringByAppendingPathComponent:_fileName];
        _filePath = businessCollegeCachePath.copy;
    }
    return self;
}

- (void)saveBusinessCollegeData:(CKYSBusinessCollegeItem *)businessCollegeItem {
    @synchronized(self) {
        NSMutableDictionary *dict = [businessCollegeItem mj_keyValues];
        [[NSUserDefaults standardUserDefaults] setValue:dict forKey:_fileName];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (CKYSBusinessCollegeItem *)loadBusinessCollegeData {
    CKYSBusinessCollegeItem *item;
    @synchronized(self) {
        NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:_fileName];
        item = [CKYSBusinessCollegeItem mj_objectWithKeyValues:dict];
    }
    return item;
}


/** 1. request success delete */
- (void)deleteBusinessCollegeData {
    @synchronized(self) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:_fileName];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (BOOL)isNeedRequestBusinessCollegeService {
    __block BOOL result = NO;
    @synchronized(self) {
        NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:CKYS_BC_CACHE_CONST];
        result = !([[dict valueForKey:@"code"] isEqualToString:@"200"] || [[dict valueForKey:@"code"]isEqualToString:@"206"]);
    }
    return result;
}

@end
