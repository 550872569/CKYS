//
//  CKYSBusinessCollegeWorkplaceCellDelegate.h
//  TableViewAutoHeight
//
//  Created by 密码：123 on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 1. 小白入门 2. 精英提升 3. 社群管理
 */

typedef NS_ENUM(NSUInteger, CKYSBusinessCollegeWorkplaceItemCellType) {
    CKYSBusinessCollegeWorkplaceItemCellTypeXBRM=0,//1. 小白入门
    CKYSBusinessCollegeWorkplaceItemCellTypeJYTS=1,//2. 精英提升
    CKYSBusinessCollegeWorkplaceItemCellTypeSQGL=2,//3. 社群管理
};

@class CKYSBusinessCollegeWorkplaceCell;

@protocol CKYSBusinessCollegeWorkplaceCellDelegate <NSObject>

- (void)businessCollegeWorkplaceCell:(CKYSBusinessCollegeWorkplaceCell *)cell actionType:(CKYSBusinessCollegeWorkplaceItemCellType)type;

@end
