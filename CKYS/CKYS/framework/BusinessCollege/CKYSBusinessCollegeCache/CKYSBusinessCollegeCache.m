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

- (instancetype)init {
    self = [super init];
    if (self) {
        _fileName = @"ckysBusinessCollegeCache";
        NSString *businessCollegeCachePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        businessCollegeCachePath = [businessCollegeCachePath stringByAppendingPathComponent:_fileName];
        _filePath = businessCollegeCachePath.copy;
    }
    return self;
}

- (BOOL)saveBusinessCollegeData:(CKYSBusinessCollegeItem *)businessCollegeItem {
    
    NSMutableDictionary *dict = [businessCollegeItem mj_keyValues];
    [[NSUserDefaults standardUserDefaults] setValue:dict forKey:_fileName];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return true;
}

- (CKYSBusinessCollegeItem *)readBusinessCollegeData {
    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:_fileName];
    CKYSBusinessCollegeItem *item = [CKYSBusinessCollegeItem mj_objectWithKeyValues:dict];
    return item;
}

@end
