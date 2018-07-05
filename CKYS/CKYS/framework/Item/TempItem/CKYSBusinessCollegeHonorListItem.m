//
//  CKYSBusinessCollegeHonorListItem.m
//  CKYS
//
//  Created by Yan on 2018/7/4.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSBusinessCollegeHonorListItem.h"

@implementation CKYSBusinessCollegeHonorListItem

- (id)copyWithZone:(nullable NSZone *)zone {
    CKYSBusinessCollegeHonorListItem *itemCopy = [[[self class] allocWithZone:zone] init];
    itemCopy->_path = _path.copy;
    return itemCopy;
}

- (id)mutableCopyWithZone:(nullable NSZone *)zone {
    CKYSBusinessCollegeHonorListItem *itemMutableCopy = [[[self class] allocWithZone:zone] init];
    itemMutableCopy->_path = _path.mutableCopy;
    return itemMutableCopy;
}

@end
