//
//  CKYSBusinessCollegeViewController.m
//  TableViewAutoHeight
//
//  Created by 密码：123 on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import "CKYSBusinessCollegeViewController.h"
#import "CKYSBusinessCollegeTableView.h"
#import "CKYSBusinessCollegeTableViewDelegate.h"

#define VGScreenW [UIScreen mainScreen].bounds.size.width
#define VGScreenH [UIScreen mainScreen].bounds.size.height
#define STATUS_AND_NAVIGATION_HEIGHT               ([UIScreen mainScreen].bounds.size.height>=812 ? 88 : 64)

@interface CKYSBusinessCollegeViewController ()

<CKYSBusinessCollegeTableViewDelegate>

@end

@implementation CKYSBusinessCollegeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTableView];
}

- (void)configTableView {
    self.view.backgroundColor =  [UIColor whiteColor];
    CKYSBusinessCollegeTableView *tableView = [[CKYSBusinessCollegeTableView alloc] initWithFrame:CGRectMake(0, STATUS_AND_NAVIGATION_HEIGHT, VGScreenW, VGScreenH-STATUS_AND_NAVIGATION_HEIGHT) style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor grayColor];
    [tableView setDelegate:self];
    [self.view addSubview:tableView];
}

#pragma mark - CKYSBusinessCollegeTableViewDelegate
- (void)CKYSBusinessCollegeCellTitleMoreButtonViewDelegate:(CKYSBusinessCollegeTableViewCellType)cellType moreAction:(UIButton *)sender {
    NSLog(@"cellType%ld",cellType);
}

- (void)businessCollegeTableViewBannerCellActionType:(CKYSBusinessCollegeTableViewCellType)type index:(NSInteger)index {
    NSLog(@"type%ld index:%ld",type,index);
}

- (void)businessCollegeTableViewWorkplaceCellActionType:(CKYSBusinessCollegeTableViewCellType)type indexType:(CKYSBusinessCollegeWorkplaceItemCellType)indexType {
    NSLog(@"type%ld indexType:%ld",type,indexType);
}

- (void)businessCollegeTableViewFreshListCellActionType:(CKYSBusinessCollegeTableViewCellType)type index:(NSInteger)index {
    NSLog(@"type%ld index:%ld",type,index);
}

- (void)businessCollegeTableViewExcellentCourseCellActionType:(CKYSBusinessCollegeTableViewCellType)type index:(NSInteger)index {
    NSLog(@"type%ld index:%ld",type,index);
}

- (void)businessCollegeTableViewFamousTeacherCellActionType:(CKYSBusinessCollegeTableViewCellType)type index:(NSInteger)index;{
    NSLog(@"type%ld index:%ld",type,index);
}



@end
