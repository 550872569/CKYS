//
//  CKYSBusinessCollegeTopnewsItem.m
//  CKYS
//
//  Created by Yan on 2018/7/4.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSBusinessCollegeTopnewsItem.h"

@implementation CKYSBusinessCollegeTopnewsItem

- (id)copyWithZone:(nullable NSZone *)zone {
    CKYSBusinessCollegeTopnewsItem *itemCopy = [[[self class] allocWithZone:zone] init];
    itemCopy->_id = _id.copy;
    itemCopy->_info = _info.copy;
    itemCopy->_detailurl = _detailurl.copy;
    itemCopy->_title = _title.copy;
    itemCopy->_typecode = _typecode.copy;
    itemCopy->_url = _url.copy;
    itemCopy->_urlshare = _urlshare.copy;
    return itemCopy;
}

- (id)mutableCopyWithZone:(nullable NSZone *)zone {
    CKYSBusinessCollegeTopnewsItem *itemMutableCopy = [[[self class] allocWithZone:zone] init];
    itemMutableCopy->_id = _id.mutableCopy;
    itemMutableCopy->_info = _info.mutableCopy;
    itemMutableCopy->_detailurl = _detailurl.mutableCopy;
    itemMutableCopy->_title = _title.mutableCopy;
    itemMutableCopy->_typecode = _typecode.mutableCopy;
    itemMutableCopy->_url = _url.mutableCopy;
    itemMutableCopy->_urlshare = _urlshare.mutableCopy;
    return itemMutableCopy;
}

@end
