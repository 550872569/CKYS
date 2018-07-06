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


/**
 请求商学院网络数据
 1. App 启动之后首次进入商学院页面 进行request一次 onceOf
 2. 进入页面先加载缓存数据 无缓存 显示placeholder
 3. request success 之后
    替换内存数据，refresh UI
    delete DiskCache oldData
    save NewData
 4. 点击tabbar item
    有缓存不进行request 拦截无效请求
    无缓存进行一次request
 5. 用户主动下拉刷新 进行request
 */
@interface CKYSBusinessCollegeService : NSObject

+ (void)postWithUrl:(NSString *)url params:(NSDictionary *)params success:(void(^)(CKYSBusinessCollegeItem *businessCollegeItem))completeHandle failure:(void(^)(NSError *error))failure;

+ (void)postBusinessCollegeServiceSuccess:(void(^)(CKYSBusinessCollegeItem *businessCollegeItem))completeHandle failure:(void(^)(NSError *error))failure;

@end
