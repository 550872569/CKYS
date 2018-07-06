//
//  CKYSBusinessCollegeServiceHelp.m
//  CKYS
//
//  Created by Yan on 2018/7/6.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSBusinessCollegeServiceHelp.h"
#import "CKYSBusinessCollegeCache.h"

NSString *CKYS_BC_SERVICE_CONST = @"CKYS_BC_SERVICE_CONST";

@implementation CKYSBusinessCollegeServiceHelp

+ (BOOL)isNeedRequestBusinessCollegeService {
    return ![[NSUserDefaults standardUserDefaults] boolForKey:CKYS_BC_SERVICE_CONST] || [CKYSBusinessCollegeCache  isNeedRequestBusinessCollegeService];
}

+ (void)setRequestBusinessCollegeServiceStatusSuccess:(BOOL)success {
    [[NSUserDefaults standardUserDefaults] setBool:success forKey:CKYS_BC_SERVICE_CONST];
}

@end
