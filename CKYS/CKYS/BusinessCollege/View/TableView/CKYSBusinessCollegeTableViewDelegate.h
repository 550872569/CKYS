//
//  CKYSBusinessCollegeTableViewDelegate.h
//  CKYS
//
//  Created by Yan on 2018/7/4.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "CKYSBusinessCollegeTitleMoreButtonViewDelegate.h"

#import "CKYSBusinessCollegeTableViewCellTypeConst.h"

#import "CKYSBusinessCollegeBannerCellDelegate.h"

#import "CKYSBusinessCollegeWorkplaceItemCellTypeConst.h"

@class CKYSBusinessCollegeBannerCell, CKYSBusinessCollegeWorkplaceCell, CKYSBusinessCollegeFreshListCell, CKYSBusinessCollegeExcellentCourseCell, CKYSBusinessCollegeFamousTeacherCell;

@protocol CKYSBusinessCollegeTableViewDelegate <CKYSBusinessCollegeTitleMoreButtonViewDelegate>

- (void)businessCollegeTableViewBannerCellActionType:(CKYSBusinessCollegeTableViewCellType)type index:(CKYSBusinessCollegeBannerCellActionType)index;

- (void)businessCollegeTableViewWorkplaceCellActionType:(CKYSBusinessCollegeTableViewCellType)type indexType:(CKYSBusinessCollegeWorkplaceItemCellType)indexType;

- (void)businessCollegeTableViewFreshListCellActionType:(CKYSBusinessCollegeTableViewCellType)type index:(NSInteger)index;

- (void)businessCollegeTableViewExcellentCourseCellActionType:(CKYSBusinessCollegeTableViewCellType)type index:(NSInteger)index;

- (void)businessCollegeTableViewFamousTeacherCellActionType:(CKYSBusinessCollegeTableViewCellType)type index:(NSInteger)index;

@end



