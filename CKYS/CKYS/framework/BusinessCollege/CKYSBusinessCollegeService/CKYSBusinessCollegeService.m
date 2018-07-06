//
//  CKYSBusinessCollegeService.m
//  CKYS
//
//  Created by Yan on 2018/7/5.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSBusinessCollegeService.h"
#import "CKYSNetworkTool.h"
#import "MJExtension.h"
#import "CKYSBusinessCollegeItem.h"
#import "CKYSBusinessCollegeServiceHelp.h"

@implementation CKYSBusinessCollegeService

+ (void)postWithUrl:(NSString *)url params:(NSDictionary *)params success:(void(^)(CKYSBusinessCollegeItem *businessCollegeItem))completeHandle failure:(void(^)(NSError *error))failure {
    [CKYSNetworkTool postWithUrl:url params:params success:^(id json) {
        if (completeHandle) {
            CKYSBusinessCollegeItem *businessCollegeItem = [CKYSBusinessCollegeItem mj_objectWithKeyValues:json];
            if ([businessCollegeItem isRequestCompleteHandleSuccess]) {
                completeHandle(businessCollegeItem);
            } else {
                NSLog(@"CKYSBusinessCollegeService completeHandle error!!!");
            }
        }
    } failure:^(NSError *error) {
        failure(error);
        NSLog(@"error%@",error);
    }];
}

#define URL @"http://ckysappserver.ckc8.com/Ckapp3/Index/getMainData"

+ (void)postBusinessCollegeServiceSuccess:(void(^)(CKYSBusinessCollegeItem *businessCollegeItem))completeHandle failure:(void(^)(NSError *error))failure {
    
    NSMutableDictionary *dictParams = [NSMutableDictionary dictionary];
    [dictParams setValue:@"" forKey:@"ckid"];
    [dictParams setValue:@"E7EA1AD8-756C-43AB-8F80-A5A794B9E111" forKey:@"deviceid"];
    [dictParams setValue:@"0" forKey:@"tgid"];
    
    [self.class postWithUrl:URL params:dictParams success:^(CKYSBusinessCollegeItem *businessCollegeItem) {
        if (businessCollegeItem.isRequestCompleteHandleSuccess) {
            [CKYSBusinessCollegeServiceHelp setRequestBusinessCollegeServiceStatusSuccess:true];
            completeHandle(businessCollegeItem);
        }
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
