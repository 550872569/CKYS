//
//  CKYSBusinessCollegeNetworkTool.m
//  CKYS
//
//  Created by Yan on 2018/7/4.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSBusinessCollegeNetworkTool.h"
#import "CKYSNetworkTool.h"

@implementation CKYSBusinessCollegeNetworkTool

+ (void)postWithUrl:(NSString *)url params:(NSDictionary *)params success:(void(^)(id json))success failure:(void(^)(NSError *error))failure {
    
    [CKYSNetworkTool postWithUrl:url params:params success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
