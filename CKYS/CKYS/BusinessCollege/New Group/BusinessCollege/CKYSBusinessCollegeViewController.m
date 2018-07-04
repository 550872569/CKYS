//
//  CKYSBusinessCollegeViewController.m
//  CKYS
//
//  Created by Yan on 18/7/2.
//  Copyright © 2018年 Yan. All rights reserved.
//

#import "CKYSBusinessCollegeViewController.h"
#import "CKYSBusinessCollegeTableView.h"
#import "CKYSBusinessCollegeTableViewDelegate.h"
#import "CKYSBCExcellentCourseViewController.h"
#import "CKYSBCCourseDetailViewController.h"
#import "CKYSBCTeacherListViewController.h"
#import "CKYSBCTeacherDetailViewController.h"


#import "CKYSBusinessCollegeXBRMViewController.h"
#import "CKYSBusinessCollegeJYTSViewController.h"
#import "CKYSBusinessCollegeSQGLViewController.h"

#import "CKYSBusinessCollegeFreshListViewController.h"
#import "CKYSBCHotCourseViewController.h"

#define VGScreenW [UIScreen mainScreen].bounds.size.width
#define VGScreenH [UIScreen mainScreen].bounds.size.height
#define STATUS_AND_NAVIGATION_HEIGHT               ([UIScreen mainScreen].bounds.size.height>=812 ? 88 : 64)

@interface CKYSBusinessCollegeViewController ()

<CKYSBusinessCollegeTableViewDelegate>

@end

@implementation CKYSBusinessCollegeViewController

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-STATUS_AND_NAVIGATION_HEIGHT)];
    [self initTableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)initTableView {
    self.view.backgroundColor =  [UIColor whiteColor];
    CKYSBusinessCollegeTableView *tableView = [[CKYSBusinessCollegeTableView alloc] initWithFrame:CGRectMake(0, STATUS_AND_NAVIGATION_HEIGHT, VGScreenW, VGScreenH-STATUS_AND_NAVIGATION_HEIGHT) style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor grayColor];
    [tableView setBusinessCollegeDelegate:self];
    [self.view addSubview:tableView];
}

#pragma mark - CKYSBusinessCollegeTableViewDelegate

#pragma mark 轮播图
- (void)businessCollegeTableViewBannerCellActionType:(CKYSBusinessCollegeTableViewCellType)type index:(CKYSBusinessCollegeBannerCellActionType)index {
    NSLog(@"type%ld index:%ld",type,index);
    [self pushToObjViewController:[[CKYSBCCourseDetailViewController alloc] init]];
}

#pragma mark 小白 精英 管理
- (void)businessCollegeTableViewWorkplaceCellActionType:(CKYSBusinessCollegeTableViewCellType)type indexType:(CKYSBusinessCollegeWorkplaceItemCellType)indexType {
    NSLog(@"type%ld indexType:%ld",type,indexType);
    if (indexType == CKYSBusinessCollegeWorkplaceItemCellTypeXBRM) {
        [self pushToObjViewController:[[CKYSBusinessCollegeXBRMViewController alloc] init]];
    } else if (indexType == CKYSBusinessCollegeWorkplaceItemCellTypeJYTS) {
        [self pushToObjViewController:[[CKYSBusinessCollegeJYTSViewController alloc] init]];
    } else if (indexType == CKYSBusinessCollegeWorkplaceItemCellTypeSQGL) {
        [self pushToObjViewController:[[CKYSBusinessCollegeSQGLViewController alloc] init]];
    }
}

#pragma mark 新鲜出炉
- (void)businessCollegeTableViewFreshListCellActionType:(CKYSBusinessCollegeTableViewCellType)type index:(NSInteger)index {
    NSLog(@"type%ld index:%ld",type,index);
    [self pushToCourseDetailViewController];
}

#pragma mark 精品课程
- (void)businessCollegeTableViewExcellentCourseCellActionType:(CKYSBusinessCollegeTableViewCellType)type index:(NSInteger)index {
    NSLog(@"type%ld index:%ld",type,index);
    [self pushToObjViewController:[[CKYSBCExcellentCourseViewController alloc] init]];
}

#pragma mark 名师推荐
- (void)businessCollegeTableViewFamousTeacherCellActionType:(CKYSBusinessCollegeTableViewCellType)type index:(NSInteger)index;{
    NSLog(@"type%ld index:%ld",type,index);
    [self pushToTeacherDetailViewController];
}

#pragma mark 更多按钮
- (void)CKYSBusinessCollegeCellTitleMoreButtonViewDelegate:(CKYSBusinessCollegeTableViewCellType)cellType moreAction:(UIButton *)sender {
    NSLog(@"cellType%ld",cellType);
    if (cellType==CKYSBusinessCollegeTableViewCellTypefFamousTeachers) {
        [self pushToTeacherListViewController];
    } else if (cellType==CKYSBusinessCollegeTableViewCellTypeExcellentCourse) {
        [self pushToCourseListViewController];
    } else if (cellType==CKYSBusinessCollegeTableViewCellTypeFreshList) {
        [self pushToObjViewController:[[CKYSBusinessCollegeFreshListViewController alloc] init]];
    }
}

#pragma mark -  private
/** 职场 & 更多 */
- (void)pushToCourseListViewController {
    [self.navigationController pushViewController:[[CKYSBCExcellentCourseViewController alloc] init] animated:true];
}

/** 课程详情 */
- (void)pushToCourseDetailViewController {
    [self.navigationController pushViewController:[[CKYSBCCourseDetailViewController alloc] init] animated:true];
}

/** 讲师大本营 */
- (void)pushToTeacherListViewController {
    [self.navigationController pushViewController:[[CKYSBCTeacherListViewController alloc] init] animated:true];
}

/** 讲师主页 */
- (void)pushToTeacherDetailViewController {
    [self.navigationController pushViewController:[[CKYSBCTeacherDetailViewController alloc] init] animated:true];
}

/** 职场vc */
- (void)pushToObjViewController:(UIViewController *)objViewController {
    [self.navigationController pushViewController:objViewController animated:true];
}

@end
