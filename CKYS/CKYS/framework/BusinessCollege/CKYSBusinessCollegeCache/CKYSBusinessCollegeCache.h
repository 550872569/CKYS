//
//  CKYSBusinessCollegeCache.h
//  CKYS
//
//  Created by Yan on 2018/7/5.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CKYSBusinessCollegeItem;

@interface CKYSBusinessCollegeCache : NSObject

/** 0. loadData in Disk */
- (CKYSBusinessCollegeItem *)loadBusinessCollegeData;

/** 1. request success delete */
- (void)deleteBusinessCollegeData;

/** 2. request success save */
- (void)saveBusinessCollegeData:(CKYSBusinessCollegeItem *)businessCollegeItem;

+ (BOOL)isNeedRequestBusinessCollegeService;

@end
