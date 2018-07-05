//
//  CKYSBusinessCollegeTableView.m
//  TableViewAutoHeight
//
//  Created by Yan on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import "CKYSBusinessCollegeTableView.h"

#import "CKYSBusinessCollegeWorkplaceCell.h"
#import "CKYSBusinessCollegeWorkplaceCellDelegate.h"

#import "CKYSBusinessCollegeFreshListCell.h"
#import "CKYSBusinessCollegeFreshListCellDelegate.h"

#import "CKYSBusinessCollegeExcellentCourseCell.h"
#import "CKYSBusinessCollegeExcellentCourseCellDelegate.h"

#import "CKYSBusinessCollegeFamousTeacherCell.h"
#import "CKYSBusinessCollegeFamousTeacherCellDelegate.h"

#import "CKYSBusinessCollegeTitleMoreButtonViewDelegate.h"
#import "CKYSBusinessCollegeBannerCell.h"
#import "CKYSBusinessCollegeBannerCellDelegate.h"
#import "CKYSBusinessCollegeTableViewDelegate.h"

#import "CKYSBusinessCollegeItem.h"

@interface CKYSBusinessCollegeTableView ()

<UITableViewDataSource,
UITableViewDelegate,
CKYSBusinessCollegeBannerCellDelegate,
CKYSBusinessCollegeWorkplaceCellDelegate,
CKYSBusinessCollegeFreshListCellDelegate,
CKYSBusinessCollegeExcellentCourseCellDelegate,
CKYSBusinessCollegeFamousTeacherCellDelegate,
CKYSBusinessCollegeTitleMoreButtonViewDelegate>

@end

@implementation CKYSBusinessCollegeTableView {
    __weak id<CKYSBusinessCollegeTableViewDelegate> _businessCollegeDelegate;
    CKYSBusinessCollegeItem *_businessCollegeItem;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self initUI];
    }
    return self;
}
- (void)initUI {
    self.delegate = self;
    self.dataSource = self;
    self.rowHeight = UITableViewAutomaticDimension;
    self.estimatedRowHeight = 200.f;
    self.backgroundColor = [UIColor grayColor];
    self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.showsHorizontalScrollIndicator = false;
    self.showsVerticalScrollIndicator = false;
    [self setAllowsSelection:false];
}

- (void)setBusinessCollegeDelegate:(id<CKYSBusinessCollegeTableViewDelegate>)delegate {
    _businessCollegeDelegate = delegate;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row==CKYSBusinessCollegeTableViewCellTypeBanner) {
        CKYSBusinessCollegeBannerCell *cell = [CKYSBusinessCollegeBannerCell cellWithTableView:tableView];
        if (_businessCollegeItem.isRequestCompleteHandleSuccess) {
            [cell setBannerItems:_businessCollegeItem.banners];
        }
        [cell setDelegate:(id)self];
        return cell;
    } else if (indexPath.row==CKYSBusinessCollegeTableViewCellTypeWorkplace) {
        CKYSBusinessCollegeWorkplaceCell *cell = [CKYSBusinessCollegeWorkplaceCell cellWithTableView:tableView];
        [cell setDelegate:(id)self];
        return cell;
    } else if (indexPath.row==CKYSBusinessCollegeTableViewCellTypeFreshList) {
        
        CKYSBusinessCollegeFreshListCell *cell = [CKYSBusinessCollegeFreshListCell cellWithTableView:tableView];
        [cell setDelegate:(id)self];
        return cell;
    } else if (indexPath.row==CKYSBusinessCollegeTableViewCellTypeExcellentCourse) {
        
        CKYSBusinessCollegeExcellentCourseCell *cell = [CKYSBusinessCollegeExcellentCourseCell cellWithTableView:tableView];
        [cell setDelegate:(id)self];
        return cell;
    } else if (indexPath.row==CKYSBusinessCollegeTableViewCellTypefFamousTeachers) {
        
        CKYSBusinessCollegeFamousTeacherCell *cell = [CKYSBusinessCollegeFamousTeacherCell cellWithTableView:tableView];
        [cell setDelegate:(id)self];
        return cell;
    } else {
        return nil;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

#pragma mark -  Cell Delegate

#pragma mark CKYSBusinessCollegeBannerCellDelegate
- (void)businessCollegeBannerCell:(CKYSBusinessCollegeBannerCell *)cell actionType:(CKYSBusinessCollegeBannerCellActionType)type {
    if (_businessCollegeDelegate && [_businessCollegeDelegate respondsToSelector:@selector(businessCollegeTableViewBannerCellActionType:index:)]) {
        [_businessCollegeDelegate businessCollegeTableViewBannerCellActionType:CKYSBusinessCollegeTableViewCellTypeBanner index:type];
    }
}

#pragma mark CKYSBusinessCollegeWorkplaceCellDelegate
- (void)businessCollegeWorkplaceCell:(CKYSBusinessCollegeWorkplaceCell *)cell actionType:(CKYSBusinessCollegeWorkplaceItemCellType)type {
    
    if (_businessCollegeDelegate && [_businessCollegeDelegate respondsToSelector:@selector(businessCollegeTableViewWorkplaceCellActionType:indexType:)]) {
        [_businessCollegeDelegate businessCollegeTableViewWorkplaceCellActionType:CKYSBusinessCollegeTableViewCellTypeWorkplace indexType:type];
    }
}

#pragma mark CKYSBusinessCollegeFreshListCellDelegate
- (void)businessCollegeFreshListCellDelegateCell:(CKYSBusinessCollegeFreshListCell *)cell indexpath:(NSIndexPath *)indexpath {
    if (_businessCollegeDelegate && [_businessCollegeDelegate respondsToSelector:@selector(businessCollegeTableViewFreshListCellActionType:index:)]) {
        [_businessCollegeDelegate businessCollegeTableViewFreshListCellActionType:CKYSBusinessCollegeTableViewCellTypeFreshList index:indexpath.row];
    }
}

#pragma mark CKYSBusinessCollegeExcellentCourseCellDelegate
- (void)businessCollegeExcellentCourseCellDelegateCell:(CKYSBusinessCollegeExcellentCourseCell *)cell indexpath:(NSIndexPath *)indexpath {
    if (_businessCollegeDelegate && [_businessCollegeDelegate respondsToSelector:@selector(businessCollegeTableViewExcellentCourseCellActionType:index:)]) {
        [_businessCollegeDelegate businessCollegeTableViewExcellentCourseCellActionType:CKYSBusinessCollegeTableViewCellTypeExcellentCourse index:indexpath.row];
    }
}

#pragma mark CKYSBusinessCollegeFamousTeacherCellDelegate
- (void)businessCollegeFamousTeacherCellDelegateCell:(CKYSBusinessCollegeFamousTeacherCell *)cell indexpath:(NSIndexPath *)indexpath {
    if (_businessCollegeDelegate && [_businessCollegeDelegate respondsToSelector:@selector(businessCollegeTableViewFamousTeacherCellActionType:index:)]) {
        [_businessCollegeDelegate businessCollegeTableViewFamousTeacherCellActionType:CKYSBusinessCollegeTableViewCellTypefFamousTeachers index:indexpath.row];
    }
}

#pragma mark CKYSBusinessCollegeTitleMoreButtonViewDelegate
- (void)CKYSBusinessCollegeCellTitleMoreButtonViewDelegate:(CKYSBusinessCollegeTableViewCellType)cellType moreAction:(UIButton *)sender {
    CKYSBusinessCollegeTableViewCellType type = CKYSBusinessCollegeTableViewCellTypeBanner;
    if (cellType==CKYSBusinessCollegeTableViewCellTypeBanner) {
    } else if (cellType==CKYSBusinessCollegeTableViewCellTypeWorkplace) {
    } else if (cellType==CKYSBusinessCollegeTableViewCellTypeFreshList) {
        type = CKYSBusinessCollegeTableViewCellTypeFreshList;
    } else if (cellType==CKYSBusinessCollegeTableViewCellTypeExcellentCourse) {
        type = CKYSBusinessCollegeTableViewCellTypeExcellentCourse;
    } else if (cellType==CKYSBusinessCollegeTableViewCellTypefFamousTeachers) {
        type = CKYSBusinessCollegeTableViewCellTypefFamousTeachers;
    }
    if (_businessCollegeDelegate && [_businessCollegeDelegate respondsToSelector:@selector(CKYSBusinessCollegeCellTitleMoreButtonViewDelegate:moreAction:)]) {
        [_businessCollegeDelegate CKYSBusinessCollegeCellTitleMoreButtonViewDelegate:type moreAction:sender];
    }
}

- (void)setBusinessCollegeItem:(CKYSBusinessCollegeItem *)businessCollegeItem {
    _businessCollegeItem = businessCollegeItem.mutableCopy;
    if (_businessCollegeItem.isRequestCompleteHandleSuccess) {
        [self reloadData];
    }
}

@end
