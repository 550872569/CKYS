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

- (id)copyWithZone:(nullable NSZone *)zone {
    CKYSBusinessCollegeItem *itemCopy = [[[self class] allocWithZone:zone] init];
    itemCopy->_applyurl = _applyurl.copy;
    itemCopy->_name = [_name copy];
    itemCopy->_ckcxyurl = _ckcxyurl.copy;
    itemCopy->_cknum = _cknum.copy;
    itemCopy->_code = _code.copy;
    itemCopy->_codeinfo = _codeinfo.copy;
    itemCopy->_giftshare = _giftshare.copy;
    itemCopy->_headurl = _headurl.copy;
    itemCopy->_helpurl = _helpurl.copy;
    itemCopy->_jointype = _jointype.copy;
    itemCopy->_moneytoday = _moneytoday.copy;
    itemCopy->_moneytotal = _moneytotal.copy;
    itemCopy->_realname = _realname.copy;
    itemCopy->_serviceprovider = _serviceprovider.copy;
    itemCopy->_shopurl = _shopurl.copy;
    itemCopy->_status = _status.copy;
    itemCopy->_top3ckheaders = _top3ckheaders.copy;
    itemCopy->_type = _type.copy;
    itemCopy->_upgradeurl = _upgradeurl.copy;
    itemCopy->_banners = _banners.copy;
    itemCopy->_honor_list = _honor_list.copy;
    itemCopy->_mediareport = _mediareport.copy;
    itemCopy->_topnews = _topnews.copy;
    return itemCopy;
}

- (id)mutableCopyWithZone:(nullable NSZone *)zone {
    CKYSBusinessCollegeItem *itemMutableCopy = [[[self class] allocWithZone:zone] init];
    itemMutableCopy->_applyurl = _applyurl.mutableCopy;
    itemMutableCopy->_name = [_name mutableCopy];
    itemMutableCopy->_ckcxyurl = _ckcxyurl.mutableCopy;
    itemMutableCopy->_cknum = _cknum.mutableCopy;
    itemMutableCopy->_code = _code.mutableCopy;
    itemMutableCopy->_codeinfo = _codeinfo.mutableCopy;
    itemMutableCopy->_giftshare = _giftshare.mutableCopy;
    itemMutableCopy->_headurl = _headurl.mutableCopy;
    itemMutableCopy->_helpurl = _helpurl.mutableCopy;
    itemMutableCopy->_jointype = _jointype.mutableCopy;
    itemMutableCopy->_moneytoday = _moneytoday.mutableCopy;
    itemMutableCopy->_moneytotal = _moneytotal.mutableCopy;
    itemMutableCopy->_realname = _realname.mutableCopy;
    itemMutableCopy->_serviceprovider = _serviceprovider.mutableCopy;
    itemMutableCopy->_shopurl = _shopurl.mutableCopy;
    itemMutableCopy->_status = _status.mutableCopy;
    itemMutableCopy->_top3ckheaders = _top3ckheaders.mutableCopy;
    itemMutableCopy->_type = _type.mutableCopy;
    itemMutableCopy->_upgradeurl = _upgradeurl.mutableCopy;
    itemMutableCopy->_banners = _banners.mutableCopy;
    itemMutableCopy->_honor_list = _honor_list.mutableCopy;
    itemMutableCopy->_mediareport = _mediareport.mutableCopy;
    itemMutableCopy->_topnews = _topnews.mutableCopy;
    return itemMutableCopy;
}

- (BOOL)isRequestCompleteHandleSuccess {
    return [self.code isEqualToString:@"200"] || [self.code isEqualToString:@"206"];
}

@end
