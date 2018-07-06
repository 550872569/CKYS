//
//  CKYSBusinessCollegeBannerCellDelegate.h
//  CKYS
//
//  Created by Yan on 2018/7/4.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 点击轮播图 index */
typedef NS_ENUM(NSInteger, CKYSBusinessCollegeBannerCellActionType) {
    CKYSBusinessCollegeBannerCellActionType_Index_0 = 0,
    CKYSBusinessCollegeBannerCellActionType_Index_1 = 1,
    CKYSBusinessCollegeBannerCellActionType_Index_2 = 2,
    CKYSBusinessCollegeBannerCellActionType_Index_3 = 3,
};

@class CKYSBusinessCollegeBannerCell;

@protocol CKYSBusinessCollegeBannerCellDelegate <NSObject>

- (void)businessCollegeBannerCell:(CKYSBusinessCollegeBannerCell *)cell actionType:(CKYSBusinessCollegeBannerCellActionType)type;

@end
