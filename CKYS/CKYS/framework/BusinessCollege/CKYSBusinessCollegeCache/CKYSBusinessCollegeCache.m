//
//  CKYSBusinessCollegeCache.m
//  CKYS
//
//  Created by Yan on 2018/7/5.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSBusinessCollegeCache.h"
#import "CKYSBusinessCollegeItem.h"
#import "CKYSFileUtils.h"
#import "MJExtension.h"

@implementation CKYSBusinessCollegeCache {
    NSString *_fileName;
    NSString *_filePath;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _fileName = @"ckysBusinessCollegeCache";
        NSString *businessCollegeCachePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        businessCollegeCachePath = [businessCollegeCachePath stringByAppendingPathComponent:_fileName];
        _filePath = businessCollegeCachePath.copy;
        [CKYSFileUtils createFileAtPath:_filePath];
    }
    return self;
}

- (BOOL)saveBusinessCollegeData:(CKYSBusinessCollegeItem *)businessCollegeItem {
    
    NSMutableDictionary *dict = [businessCollegeItem mj_keyValues];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dict];
    [CKYSFileUtils writeData:data toFileAtPath:_filePath];
    
    return true;
}

- (CKYSBusinessCollegeItem *)readBusinessCollegeData {
    NSData *data =  [CKYSFileUtils readFileAtPath:_filePath];
    
    return nil;
}

@end
