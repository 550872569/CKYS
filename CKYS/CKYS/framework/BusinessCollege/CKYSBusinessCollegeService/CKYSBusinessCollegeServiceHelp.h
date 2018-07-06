//
//  CKYSBusinessCollegeServiceHelp.h
//  CKYS
//
//  Created by Yan on 2018/7/6.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *CKYS_BC_SERVICE_CONST;

@interface CKYSBusinessCollegeServiceHelp : NSObject

+ (BOOL)isNeedRequestBusinessCollegeService;

/**
 存储请求数据 状态

 @param success YES 已经缓存 NO 无缓存
 */
+ (void)setRequestBusinessCollegeServiceStatusSuccess:(BOOL)success;

@end
