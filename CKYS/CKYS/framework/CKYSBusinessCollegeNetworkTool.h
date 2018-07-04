//
//  CKYSBusinessCollegeNetworkTool.h
//  CKYS
//
//  Created by Yan on 2018/7/4.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CKYSBusinessCollegeNetworkTool : NSObject

+ (void)postWithUrl:(NSString *)url params:(NSDictionary *)params success:(void(^)(id json))success failure:(void(^)(NSError *error))failure;

@end
