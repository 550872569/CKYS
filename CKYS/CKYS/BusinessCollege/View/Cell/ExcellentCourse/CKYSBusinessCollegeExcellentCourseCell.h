//
//  CKYSBusinessCollegeExcellentCourseCell.h
//  CKYS
//
//  Created by Yan on 2018/7/3.
//  Copyright © 2018年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CKYSBusinessCollegeTitleMoreButtonViewDelegate.h"

@protocol CKYSBusinessCollegeExcellentCourseCellDelegate;

@class CKYSBusinessCollegeMediaReportItem;

/** 精品课程 */
@interface CKYSBusinessCollegeExcellentCourseCell : UITableViewCell <CKYSBusinessCollegeTitleMoreButtonViewDelegate>

+ (instancetype)cellWithTableView:(UITableView *)tableView;

- (void)setDelegate:(id<CKYSBusinessCollegeExcellentCourseCellDelegate>)delegate;

- (void)setMediaReportItems:(NSArray <CKYSBusinessCollegeMediaReportItem *>*)ediaReportItems;

@end
