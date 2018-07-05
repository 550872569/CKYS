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
        
//        NSString *path = @"/Users/android_ls/Desktop/city_province.json";
//        NSArray *array = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:NSJSONReadingMutableLeaves error:nil];
//        [array writeToFile:@"/Users/android_ls/Desktop/city_province.plist" atomically:YES];
        
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
