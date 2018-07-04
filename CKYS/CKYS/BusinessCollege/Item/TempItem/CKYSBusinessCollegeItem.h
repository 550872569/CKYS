//
//  CKYSBusinessCollegeItem.h
//  CKYS
//
//  Created by Yan on 2018/7/4.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CKYSBusinessCollegeBannerItem.h"
#import "CKYSBusinessCollegeHonorListItem.h"
#import "CKYSBusinessCollegeMediaReportItem.h"
#import "CKYSBusinessCollegeTopnewsItem.h"

@class CKYSBusinessCollegeBannerItem, CKYSBusinessCollegeHonorListItem, CKYSBusinessCollegeMediaReportItem, CKYSBusinessCollegeTopnewsItem;

@interface CKYSBusinessCollegeItem : NSObject

@property (nonatomic, copy) NSString *applyurl;
@property (nonatomic, copy) NSString *ckcxyurl;
@property (nonatomic, copy) NSString *cknum;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *codeinfo;

@property (nonatomic, copy) NSString *giftshare;
@property (nonatomic, copy) NSString *headurl;
@property (nonatomic, copy) NSString *helpurl;
@property (nonatomic, strong) NSArray <CKYSBusinessCollegeBannerItem *>*banners;
@property (nonatomic, copy) NSArray <CKYSBusinessCollegeHonorListItem *>*honor_list;

@property (nonatomic, copy) NSString *jointype;
@property (nonatomic, copy) NSArray <CKYSBusinessCollegeMediaReportItem *>*mediareport;
@property (nonatomic, copy) NSString *moneytoday;
@property (nonatomic, copy) NSString *moneytotal;
@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *realname;
@property (nonatomic, copy) NSString *serviceprovider;
@property (nonatomic, copy) NSString *shopurl;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSArray *top3ckheaders;

@property (nonatomic, copy) NSArray <CKYSBusinessCollegeTopnewsItem *>*topnews;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *upgradeurl;

@end
