//
//  CKYSBusinessCollegeFamousTeacherCell.h
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CKYSBusinessCollegeTitleMoreButtonViewDelegate.h"

@class CKYSBusinessCollegeHonorListItem;

@protocol CKYSBusinessCollegeFamousTeacherCellDelegate;

/** 名师推荐cell */
@interface CKYSBusinessCollegeFamousTeacherCell : UITableViewCell <CKYSBusinessCollegeTitleMoreButtonViewDelegate>

+ (instancetype)cellWithTableView:(UITableView *)tableView;

- (void)setDelegate:(id<CKYSBusinessCollegeFamousTeacherCellDelegate>)delegate;

- (void)setFamousTeacherItems:(NSArray <CKYSBusinessCollegeHonorListItem *>*)famousTeacherItems;

@end
