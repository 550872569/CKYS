//
//  CKYSBusinessCollegeItem.m
//  CKYS
//
//  Created by Yan on 2018/7/4.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSBusinessCollegeItem.h"

#import "CKYSBusinessCollegeBannerItem.h"
#import "CKYSBusinessCollegeHonorListItem.h"
#import "CKYSBusinessCollegeMediaReportItem.h"
#import "CKYSBusinessCollegeTopnewsItem.h"

@implementation CKYSBusinessCollegeItem

+ (NSDictionary *)objectClassInArray {
    return @{ @"banners":[CKYSBusinessCollegeBannerItem class],
              @"honor_list":[CKYSBusinessCollegeHonorListItem class],
              @"mediareport":[CKYSBusinessCollegeMediaReportItem class],
              @"topnews":[CKYSBusinessCollegeTopnewsItem class] };
}

@end
