//
//  CKYSNetworkTool.m
//  CKYS
//
//  Created by Yan on 2018/7/4.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSNetworkTool.h"
#import "AFNetworking.h"
#import "MJExtension.h"

@implementation CKYSNetworkTool


+ (void)postWithUrl:(NSString *)url params:(NSDictionary *)params success:(void(^)(id json))success failure:(void(^)(NSError *error))failure{
    
    //  AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    
    if ([url containsString:@"Ckapp3/Regist/getValidateCode"]) {
        manager.requestSerializer.timeoutInterval = 60;
    }else{
        manager.requestSerializer.timeoutInterval = 10;
    }
    
    NSLog(@"params:%@\nurl:%@", params, url);
    
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *jsonStr = [responseObject mj_JSONString];
        NSLog(@"\n\n\n[---POST----Result----]:%@     --request.URL-->%@\n\n\n", jsonStr, url);
        if (success){
            NSDictionary *dict = responseObject;
            NSString *code = [NSString stringWithFormat:@"%@",dict[@"code"]];
            NSString *noticeString = [NSString stringWithFormat:@"%@",dict[@"codeinfo"]];
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"网络请求错误%@", error);
        if (failure) {
            failure(error);
        }
    }];
    
}


@end
