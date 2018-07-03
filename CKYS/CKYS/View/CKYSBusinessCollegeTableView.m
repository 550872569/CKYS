//
//  CKYSBusinessCollegeTableView.m
//  TableViewAutoHeight
//
//  Created by 密码：123 on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import "CKYSBusinessCollegeTableView.h"

#import "CKYSBusinessCollegeWorkplaceCell.h"
#import "CKYSBusinessCollegeWorkplaceCellDelegate.h"

#import "CKYSBusinessCollegeFreshListCell.h"
#import "CKYSBusinessCollegeFreshListCellDelegate.h"


@interface CKYSBusinessCollegeTableView ()

<UITableViewDataSource,
UITableViewDelegate,
CKYSBusinessCollegeWorkplaceCellDelegate,
CKYSBusinessCollegeFreshListCellDelegate>

@end

@implementation CKYSBusinessCollegeTableView

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
    self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row==CKYSBusinessCollegeTableViewCellTypeWorkplace) {
        CKYSBusinessCollegeWorkplaceCell *cell = [CKYSBusinessCollegeWorkplaceCell cellWithTableView:tableView];
        [cell setDelegate:(id)self];
        return cell;

    } else if (indexPath.row==CKYSBusinessCollegeTableViewCellTypeFreshList) {
        
        CKYSBusinessCollegeFreshListCell *cell = [CKYSBusinessCollegeFreshListCell cellWithTableView:tableView];
        [cell setDelegate:(id)self];
        return cell;

    } else if (indexPath.row==CKYSBusinessCollegeTableViewCellTypeExcellentCourse) {
        return nil;

    } else if (indexPath.row==CKYSBusinessCollegeTableViewCellTypefFamousTeachers) {
        return nil;

    } else {
        return nil;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - CKYSBusinessCollegeWorkplaceCellDelegate
- (void)businessCollegeWorkplaceCell:(CKYSBusinessCollegeWorkplaceCell *)cell actionType:(CKYSBusinessCollegeWorkplaceItemCellType)type {
    switch (type) {
            case CKYSBusinessCollegeWorkplaceItemCellTypeXBRM:
            
            break;
            case CKYSBusinessCollegeWorkplaceItemCellTypeJYTS:
            
            break;
            case CKYSBusinessCollegeWorkplaceItemCellTypeSQGL:
            
            break;
    }
}

#pragma mark - CKYSBusinessCollegeFreshListCellDelegate

- (void)businessCollegeFreshListCellDelegateCell:(CKYSBusinessCollegeFreshListCell *)cell actionType:(int)type {
    
}

@end
