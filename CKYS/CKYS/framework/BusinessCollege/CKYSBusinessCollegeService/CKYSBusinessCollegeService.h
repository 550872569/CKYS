//
//  CKYSBusinessCollegeService.h
//  CKYS
//
//  Created by Yan on 2018/7/5.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CKYSNetworkTool.h"

@class CKYSBusinessCollegeItem;

@interface CKYSBusinessCollegeService : NSObject

+ (void)postWithUrl:(NSString *)url params:(NSDictionary *)params success:(void(^)(CKYSBusinessCollegeItem *businessCollegeItem))completeHandle failure:(void(^)(NSError *error))failure;

+ (void)postBusinessCollegeServiceSuccess:(void(^)(CKYSBusinessCollegeItem *businessCollegeItem))completeHandle failure:(void(^)(NSError *error))failure;

@end
